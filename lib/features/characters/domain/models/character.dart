class Character {
  final String id;
  final String name;
  final String role;      // e.g. Captain, Swordsman, Navigator
  final String affiliation; // e.g. Straw Hat Pirates, Marines
  final int? bounty;      // in berries
  final String? devilFruit;
  final String firstAppearanceArc; // simple string for now

  const Character({
    required this.id,
    required this.name,
    required this.role,
    required this.affiliation,
    this.bounty,
    this.devilFruit,
    required this.firstAppearanceArc,
  });
}
