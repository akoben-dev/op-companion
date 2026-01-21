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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              location.sea,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Key arcs: ${location.keyArcs}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Text(
              location.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            const Text(
              'Later you can link this location to arcs and chapters that happen here.',
            ),
          ],
        ),
      ),
    );
  }
}
