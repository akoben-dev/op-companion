// lib/features/encyclopedia/application/locations_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/locations_repository.dart';
import '../domain/models/location.dart';

final locationsRepositoryProvider = Provider<LocationsRepository>((ref) {
  return const LocationsRepository();
});

final allLocationsProvider = Provider<List<Location>>((ref) {
  final repo = ref.watch(locationsRepositoryProvider);
  return repo.getAllLocations();
});

// 'All', 'East Blue', 'Paradise', 'Grand Line', 'New World', etc.
final locationSeaFilterProvider = StateProvider<String>((ref) => 'All');

final filteredLocationsProvider = Provider<List<Location>>((ref) {
  final all = ref.watch(allLocationsProvider);
  final seaFilter = ref.watch(locationSeaFilterProvider);

  if (seaFilter == 'All') return all;

  // Smart filtering: check if the location's sea contains the filter term
  return all.where((loc) {
    final sea = loc.sea.toLowerCase();
    final filter = seaFilter.toLowerCase();

    // Direct match or contains check
    if (sea == filter) return true;
    if (sea.contains(filter)) return true;

    // Special cases
    if (filter == 'grand line' && (sea.contains('paradise') || sea.contains('grand line'))) {
      return true;
    }

    return false;
  }).toList();
});

final locationByIdProvider =
    Provider.family<Location?, String>((ref, id) {
  final repo = ref.watch(locationsRepositoryProvider);
  return repo.getById(id);
});
