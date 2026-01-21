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

// 'All', 'East Blue', 'Grand Line', 'New World', etc.
final locationSeaFilterProvider = StateProvider<String>((ref) => 'All');

final filteredLocationsProvider = Provider<List<Location>>((ref) {
  final all = ref.watch(allLocationsProvider);
  final seaFilter = ref.watch(locationSeaFilterProvider);

  if (seaFilter == 'All') return all;

  return all.where((loc) => loc.sea == seaFilter).toList();
});

final locationByIdProvider =
    Provider.family<Location?, String>((ref, id) {
  final repo = ref.watch(locationsRepositoryProvider);
  return repo.getById(id);
});
