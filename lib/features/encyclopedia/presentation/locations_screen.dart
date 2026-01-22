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
                label: 'Paradise',
                isSelected: seaFilter == 'Paradise',
                onTap: () => ref
                    .read(locationSeaFilterProvider.notifier)
                    .state = 'Paradise',
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
                  leading: Icon(
                    _getSeaIcon(loc.sea),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: Text(loc.name),
                  subtitle: Text(
                    '${loc.sea} · First appeared: ${_formatArcId(loc.firstAppearanceArc)}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: const Icon(Icons.chevron_right),
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

  IconData _getSeaIcon(String sea) {
    if (sea.contains('East Blue')) return Icons.wb_sunny;
    if (sea.contains('Paradise')) return Icons.sailing;
    if (sea.contains('New World')) return Icons.explore;
    if (sea.contains('Sky Island')) return Icons.cloud;
    if (sea.contains('Calm Belt')) return Icons.waves;
    if (sea.contains('Underwater')) return Icons.water;
    return Icons.place;
  }

  String _formatArcId(String arcId) {
    // Convert snake_case to Title Case
    return arcId
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
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
