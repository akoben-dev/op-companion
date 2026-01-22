// lib/features/encyclopedia/domain/models/location.dart
class Location {
  final String id;
  final String name;
  final String sea; // East Blue, West Blue, North Blue, South Blue, Grand Line, New World
  final String description;
  final String? notableResidents; // Optional: comma-separated list
  final String firstAppearanceArc;

  const Location({
    required this.id,
    required this.name,
    required this.sea,
    required this.description,
    this.notableResidents,
    required this.firstAppearanceArc,
  });
}
