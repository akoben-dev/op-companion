// lib/features/chapters/domain/models/chapter.dart
class Chapter {
  final String id;
  final int number;
  final String title;
  final String arcId;

  const Chapter({
    required this.id,
    required this.number,
    required this.title,
    required this.arcId,
  });
}
