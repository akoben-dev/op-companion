// lib/features/chapters/data/chapters_repository.dart
import '../domain/models/chapter.dart';

class ChaptersRepository {
  const ChaptersRepository();

  // Single source of truth for all chapters (temporary hardcoded data)
  static const List<Chapter> _all = [
    Chapter(
      id: 'ch_1',
      number: 1,
      title: 'Romance Dawn',
      arcId: 'east_blue',
    ),
    Chapter(
      id: 'ch_2',
      number: 2,
      title: 'They Call Him Straw Hat Luffy',
      arcId: 'east_blue',
    ),
    Chapter(
      id: 'ch_155',
      number: 155,
      title: 'Off to Alabasta!',
      arcId: 'alabasta',
    ),
    Chapter(
      id: 'ch_156',
      number: 156,
      title: 'The Adventure in the Kingdom of Sand!',
      arcId: 'alabasta',
    ),
  ];

  List<Chapter> getAllChapters() {
    // Return a copy so callers can’t accidentally mutate the static list
    return List<Chapter>.from(_all);
  }

  List<Chapter> getChaptersForArc(String arcId) {
    return _all.where((c) => c.arcId == arcId).toList();
  }

  Chapter? getChapterById(String id) {
    return _all.firstWhere(
      (c) => c.id == id,
      orElse: () => _all.first,
    );
  }
}
