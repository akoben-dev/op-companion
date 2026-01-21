// lib/features/encyclopedia/application/devil_fruits_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/devil_fruits_repository.dart';
import '../domain/models/devil_fruit.dart';

final devilFruitsRepositoryProvider =
    Provider<DevilFruitsRepository>((ref) {
  return const DevilFruitsRepository();
});

final allDevilFruitsProvider = Provider<List<DevilFruit>>((ref) {
  final repo = ref.watch(devilFruitsRepositoryProvider);
  return repo.getAllFruits();
});

// current type filter: 'All', 'Paramecia', 'Zoan', 'Logia'
final devilFruitTypeFilterProvider =
    StateProvider<String>((ref) => 'All');

final filteredDevilFruitsProvider = Provider<List<DevilFruit>>((ref) {
  final all = ref.watch(allDevilFruitsProvider);
  final typeFilter = ref.watch(devilFruitTypeFilterProvider);

  if (typeFilter == 'All') return all;

  return all.where((f) => f.type == typeFilter).toList();
});

final devilFruitByIdProvider =
    Provider.family<DevilFruit?, String>((ref, id) {
  final repo = ref.watch(devilFruitsRepositoryProvider);
  return repo.getById(id);
});
