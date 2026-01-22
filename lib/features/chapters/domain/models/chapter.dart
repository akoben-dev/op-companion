class Chapter {
  final String id;
  final int number;
  final String title;
  final String arcId;
  final String? releaseDate;
  final bool isMilestone;
  final String? summary;

  const Chapter({
    required this.id,
    required this.number,
    required this.title,
    required this.arcId,
    this.releaseDate,
    this.isMilestone = false,
    this.summary,
  });
}
