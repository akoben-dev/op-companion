// lib/features/chapters/application/chapters_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/chapters_repository.dart';
import '../domain/models/chapter.dart';

final chaptersRepositoryProvider = Provider<ChaptersRepository>((ref) {
  return const ChaptersRepository();
});

final allChaptersProvider = Provider<List<Chapter>>((ref) {
  final repo = ref.watch(chaptersRepositoryProvider);
  return repo.getAllChapters();
});

final chaptersForArcProvider =
    Provider.family<List<Chapter>, String>((ref, arcId) {
  final repo = ref.watch(chaptersRepositoryProvider);
  return repo.getChaptersForArc(arcId);
});

final chapterByIdProvider =
    Provider.family<Chapter?, String>((ref, chapterId) {
  final repo = ref.watch(chaptersRepositoryProvider);
  return repo.getChapterById(chapterId);
});
