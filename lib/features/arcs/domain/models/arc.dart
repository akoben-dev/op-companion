// lib/features/arcs/domain/models/arc.dart
class Arc {
  final String id;
  final String name;
  final String saga;
  final int startChapter;
  final int endChapter;
  final String summary;

  // NEW
  final String? imageUrl; // optional CDN image

  const Arc({
    required this.id,
    required this.name,
    required this.saga,
    required this.startChapter,
    required this.endChapter,
    required this.summary,
    this.imageUrl,
  });
}
