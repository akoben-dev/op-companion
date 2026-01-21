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
        // Type filter chips
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
              return Card(
                child: ListTile(
                  title: Text(fruit.name),
                  subtitle: Text(
                    fruit.subType != null
                        ? '${fruit.type} · ${fruit.subType}'
                        : fruit.type,
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
