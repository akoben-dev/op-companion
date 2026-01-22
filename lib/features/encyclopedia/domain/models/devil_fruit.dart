// lib/features/encyclopedia/domain/models/devil_fruit.dart
class DevilFruit {
  final String id;
  final String name;
  final String type; // Paramecia, Zoan, Logia, Other
  final String? subType; // e.g. Mythical Zoan, Ancient Zoan
  final String description;
  final String? user;
  final String firstAppearanceArc;

  // NEW
  final String? imageUrl; // network url to your CDN (optional)

  const DevilFruit({
    required this.id,
    required this.name,
    required this.type,
    this.subType,
    required this.description,
    this.user,
    required this.firstAppearanceArc,
    this.imageUrl,
  });
}
