// lib/features/characters/presentation/character_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/characters_providers.dart';

class CharacterDetailScreen extends ConsumerWidget {
  const CharacterDetailScreen({
    super.key,
    required this.characterId,
  });

  final String characterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final character = ref.watch(characterByIdProvider(characterId));

    if (character == null) {
      return const Scaffold(
        body: Center(child: Text('Character not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _NetworkHeaderImage(
              imageUrl: character.imageUrl,
              fallbackText: character.name,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _TagChip(icon: Icons.badge, label: character.role),
                      _TagChip(icon: Icons.flag, label: character.affiliation),
                      if (character.devilFruit != null)
                        _TagChip(icon: Icons.bubble_chart, label: 'Devil Fruit'),
                      if (character.bounty != null)
                        _TagChip(icon: Icons.local_atm, label: 'Bounty'),
                    ],
                  ),
                  const SizedBox(height: 20),

                  _InfoRow(
                    icon: Icons.auto_stories,
                    label: 'First appearance',
                    value: character.firstAppearanceArc,
                  ),
                  const SizedBox(height: 8),

                  if (character.devilFruit != null) ...[
                    _InfoRow(
                      icon: Icons.bubble_chart,
                      label: 'Devil Fruit',
                      value: character.devilFruit!,
                    ),
                    const SizedBox(height: 8),
                  ],

                  if (character.bounty != null) ...[
                    _InfoRow(
                      icon: Icons.local_atm,
                      label: 'Bounty',
                      value: _formatBounty(character.bounty!),
                    ),
                    const SizedBox(height: 8),
                  ],

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
                    '• Appearance timeline (chapters/arcs)\n'
                    '• Relationships (crew/allies/enemies)\n'
                    '• Power/abilities summary\n'
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

  String _formatBounty(int bounty) {
    // 3000000000 -> 3,000,000,000 berries
    final s = bounty.toString();
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      final reverseIndex = s.length - i;
      buf.write(s[i]);
      if (reverseIndex > 1 && reverseIndex % 3 == 1) {
        buf.write(',');
      }
    }
    return '$buf berries';
  }
}

class _NetworkHeaderImage extends StatelessWidget {
  const _NetworkHeaderImage({
    required this.imageUrl,
    required this.fallbackText,
  });

  final String? imageUrl;
  final String fallbackText;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: color.surfaceContainerHighest,
        child: (imageUrl == null || imageUrl!.isEmpty)
            ? _NeutralFallback(fallbackText: fallbackText)
            : Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                // Loading state [page:1]
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      color: color.primary,
                    ),
                  );
                },
                // Error/offline fallback [page:0]
                errorBuilder: (context, error, stackTrace) {
                  return _NeutralFallback(fallbackText: fallbackText);
                },
              ),
      ),
    );
  }
}

class _NeutralFallback extends StatelessWidget {
  const _NeutralFallback({required this.fallbackText});

  final String fallbackText;

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
          Icon(Icons.person, size: 56, color: color.onSurfaceVariant),
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
