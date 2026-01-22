// lib/features/encyclopedia/presentation/devil_fruits_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../application/devil_fruits_providers.dart';

class DevilFruitsScreen extends ConsumerWidget {
  const DevilFruitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fruits = ref.watch(filteredDevilFruitsProvider);
    final typeFilter = ref.watch(devilFruitTypeFilterProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Wrap(
            spacing: 8,
            children: [
              _TypeChip(
                label: 'All',
                isSelected: typeFilter == 'All',
                onTap: () => ref
                    .read(devilFruitTypeFilterProvider.notifier)
                    .state = 'All',
              ),
              _TypeChip(
                label: 'Paramecia',
                isSelected: typeFilter == 'Paramecia',
                onTap: () => ref
                    .read(devilFruitTypeFilterProvider.notifier)
                    .state = 'Paramecia',
              ),
              _TypeChip(
                label: 'Zoan',
                isSelected: typeFilter == 'Zoan',
                onTap: () => ref
                    .read(devilFruitTypeFilterProvider.notifier)
                    .state = 'Zoan',
              ),
              _TypeChip(
                label: 'Logia',
                isSelected: typeFilter == 'Logia',
                onTap: () => ref
                    .read(devilFruitTypeFilterProvider.notifier)
                    .state = 'Logia',
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: fruits.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final fruit = fruits[index];

              final typeText = fruit.subType != null
                  ? '${fruit.type} · ${fruit.subType}'
                  : fruit.type;

              return Card(
                child: ListTile(
                  key: ValueKey(fruit.id),
                  leading: SizedBox(
                    width: 40,
                    height: 40,
                    child: _FruitAvatar(
                      name: fruit.name,
                      imageUrl: fruit.imageUrl,
                    ),
                  ),
                  title: Text(
                    fruit.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    typeText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: fruit.user != null
                      ? Text(
                          fruit.user!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      : null,
                  onTap: () {
                    context.push('/fruit/${fruit.id}');
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _TypeChip extends StatelessWidget {
  const _TypeChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
    );
  }
}

class _FruitAvatar extends StatelessWidget {
  const _FruitAvatar({
    required this.name,
    required this.imageUrl,
  });

  final String name;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final initials = name
        .trim()
        .split(RegExp(r'\s+'))
        .take(2)
        .map((w) => w.isNotEmpty ? w[0].toUpperCase() : '')
        .join();

    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;
    final imageProvider = hasImage ? NetworkImage(imageUrl!) : null;

    return CircleAvatar(
      backgroundColor: color.surfaceContainerHighest,
      foregroundImage: imageProvider,
      // must be null when imageProvider is null (same assert you hit earlier)
      onForegroundImageError: hasImage ? (_, __) {} : null,
      child: Text(
        initials.isEmpty ? '—' : initials,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: color.onSurfaceVariant,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
