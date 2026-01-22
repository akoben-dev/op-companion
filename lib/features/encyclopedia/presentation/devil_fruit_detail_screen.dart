// lib/features/encyclopedia/presentation/devil_fruit_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/devil_fruits_providers.dart';

class DevilFruitDetailScreen extends ConsumerWidget {
  const DevilFruitDetailScreen({
    super.key,
    required this.fruitId,
  });

  final String fruitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fruit = ref.watch(devilFruitByIdProvider(fruitId));

    if (fruit == null) {
      return const Scaffold(
        body: Center(child: Text('Devil Fruit not found')),
      );
    }

    final typeLine = fruit.subType != null
        ? '${fruit.type} · ${fruit.subType}'
        : fruit.type;

    return Scaffold(
      appBar: AppBar(
        title: Text(fruit.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _NetworkHeaderImage(
              imageUrl: fruit.imageUrl,
              fallbackText: fruit.name,
              icon: Icons.bubble_chart,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fruit.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    typeLine,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _TagChip(icon: Icons.category, label: fruit.type),
                      if (fruit.subType != null)
                        _TagChip(icon: Icons.auto_awesome, label: fruit.subType!),
                      if (fruit.user != null)
                        _TagChip(icon: Icons.person, label: 'User known'),
                    ],
                  ),

                  const SizedBox(height: 20),
                  _InfoRow(
                    icon: Icons.auto_stories,
                    label: 'First appearance',
                    value: fruit.firstAppearanceArc,
                  ),
                  const SizedBox(height: 8),
                  if (fruit.user != null) ...[
                    _InfoRow(
                      icon: Icons.person,
                      label: 'User',
                      value: fruit.user!,
                    ),
                    const SizedBox(height: 8),
                  ],

                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),
                  Text(
                    'About',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    fruit.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),
                  Text(
                    'Coming Soon',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Future updates will include:\n'
                    '• Linked characters\n'
                    '• Linked chapters/arcs\n'
                    '• Awakening / special notes\n'
                    '• Image gallery',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.6),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NetworkHeaderImage extends StatelessWidget {
  const _NetworkHeaderImage({
    required this.imageUrl,
    required this.fallbackText,
    required this.icon,
  });

  final String? imageUrl;
  final String fallbackText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: color.surfaceContainerHighest,
        child: (imageUrl == null || imageUrl!.isEmpty)
            ? _NeutralFallback(fallbackText: fallbackText, icon: icon)
            : Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                // loading state [page:0]
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(color: color.primary),
                  );
                },
                // offline/bad url fallback [page:1]
                errorBuilder: (context, error, stackTrace) {
                  return _NeutralFallback(fallbackText: fallbackText, icon: icon);
                },
              ),
      ),
    );
  }
}

class _NeutralFallback extends StatelessWidget {
  const _NeutralFallback({
    required this.fallbackText,
    required this.icon,
  });

  final String fallbackText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final initials = fallbackText
        .trim()
        .split(RegExp(r'\s+'))
        .take(2)
        .map((w) => w.isNotEmpty ? w[0].toUpperCase() : '')
        .join();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 56, color: color.onSurfaceVariant),
          const SizedBox(height: 8),
          Text(
            initials.isEmpty ? '—' : initials,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: color.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 6),
          Text(
            'Image unavailable',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: color.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: color.primary),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Chip(
      avatar: Icon(icon, size: 18, color: color.primary),
      label: Text(label),
      backgroundColor: color.surfaceContainerHighest,
    );
  }
}
