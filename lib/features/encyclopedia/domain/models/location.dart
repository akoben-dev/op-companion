// lib/features/encyclopedia/domain/models/location.dart
class Location {
  final String id;
  final String name;
  final String sea; // East Blue, West Blue, North Blue, South Blue, Grand Line, New World
  final String description;
  final String keyArcs; // short text listing key arcs

  const Location({
    required this.id,
    required this.name,
    required this.sea,
    required this.description,
    required this.keyArcs,
  });
}
