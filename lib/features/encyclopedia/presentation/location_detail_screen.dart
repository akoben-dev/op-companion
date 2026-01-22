// lib/features/encyclopedia/presentation/location_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/locations_providers.dart';

class LocationDetailScreen extends ConsumerWidget {
  const LocationDetailScreen({
    super.key,
    required this.locationId,
  });

  final String locationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(locationByIdProvider(locationId));

    if (location == null) {
      return const Scaffold(
        body: Center(child: Text('Location not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location name header
            Text(
              location.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),

            // Sea/Region
            _InfoRow(
              icon: Icons.public,
              label: 'Region',
              value: location.sea,
              context: context,
            ),
            const SizedBox(height: 8),

            // First Appearance
            _InfoRow(
              icon: Icons.history,
              label: 'First Appearance',
              value: _formatArcId(location.firstAppearanceArc),
              context: context,
            ),
            const SizedBox(height: 24),

            // Description
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
              location.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            // Notable Residents
            if (location.notableResidents != null) ...[
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 16),
              Text(
                'Notable Residents',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: location.notableResidents!
                    .split(',')
                    .map((resident) => Chip(
                          avatar: Icon(
                            Icons.person,
                            size: 18,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          label: Text(
                            resident.trim(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest,
                        ))
                    .toList(),
              ),
            ],

            // Future features
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
              '• Linked arcs and chapters\n'
              '• Image gallery\n'
              '• Related characters\n'
              '• Map view',
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
    );
  }

  String _formatArcId(String arcId) {
    // Convert snake_case to Title Case
    return arcId
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.context,
  });

  final IconData icon;
  final String label;
  final String value;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
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
