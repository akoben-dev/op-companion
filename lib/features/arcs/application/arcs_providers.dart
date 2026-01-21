// lib/features/arcs/application/arcs_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/arcs_repository.dart';
import '../domain/models/arc.dart';

final arcsRepositoryProvider = Provider<ArcsRepository>((ref) {
  return const ArcsRepository();
});

final arcsProvider = Provider<List<Arc>>((ref) {
  final repo = ref.watch(arcsRepositoryProvider);
  return repo.getArcs();
});
