// lib/features/encyclopedia/presentation/locations_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../application/locations_providers.dart';

class LocationsScreen extends ConsumerWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locations = ref.watch(filteredLocationsProvider);
    final seaFilter = ref.watch(locationSeaFilterProvider);

    return Column(
      children: [
        // Sea filter chips
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Wrap(
            spacing: 8,
            children: [
              _SeaChip(
                label: 'All',
                isSelected: seaFilter == 'All',
                onTap: () => ref
                    .read(locationSeaFilterProvider.notifier)
                    .state = 'All',
              ),
              _SeaChip(
                label: 'East Blue',
                isSelected: seaFilter == 'East Blue',
                onTap: () => ref
                    .read(locationSeaFilterProvider.notifier)
                    .state = 'East Blue',
              ),
              _SeaChip(
                label: 'Grand Line',
                isSelected: seaFilter == 'Grand Line',
                onTap: () => ref
                    .read(locationSeaFilterProvider.notifier)
                    .state = 'Grand Line',
              ),
              _SeaChip(
                label: 'New World',
                isSelected: seaFilter == 'New World',
                onTap: () => ref
                    .read(locationSeaFilterProvider.notifier)
                    .state = 'New World',
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: locations.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final loc = locations[index];
              return Card(
                child: ListTile(
                  title: Text(loc.name),
                  subtitle: Text('${loc.sea} · ${loc.keyArcs}'),
                  onTap: () {
                    context.push('/location/${loc.id}');
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

class _SeaChip extends StatelessWidget {
  const _SeaChip({
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
