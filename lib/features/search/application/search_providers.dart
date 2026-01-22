// lib/features/search/application/search_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_piece_companion/features/characters/application/characters_providers.dart';
import 'package:one_piece_companion/features/encyclopedia/application/devil_fruits_providers.dart';
import 'package:one_piece_companion/features/encyclopedia/application/locations_providers.dart';
import 'package:one_piece_companion/features/arcs/application/arcs_providers.dart';
import 'package:one_piece_companion/features/chapters/application/chapters_providers.dart';

import 'package:one_piece_companion/features/characters/domain/models/character.dart';
import 'package:one_piece_companion/features/encyclopedia/domain/models/devil_fruit.dart';
import 'package:one_piece_companion/features/encyclopedia/domain/models/location.dart';
import 'package:one_piece_companion/features/arcs/domain/models/arc.dart';
import 'package:one_piece_companion/features/chapters/domain/models/chapter.dart';

/// Current search query
final searchQueryProvider = StateProvider<String>((ref) => '');

/// Search results grouped by type
class SearchResults {
  final List<Character> characters;
  final List<DevilFruit> fruits;
  final List<Location> locations;
  final List<Arc> arcs;
  final List<Chapter> chapters;

  SearchResults({
    required this.characters,
    required this.fruits,
    required this.locations,
    required this.arcs,
    required this.chapters,
  });

  bool get isEmpty =>
      characters.isEmpty &&
      fruits.isEmpty &&
      locations.isEmpty &&
      arcs.isEmpty &&
      chapters.isEmpty;
}

final searchResultsProvider = Provider<SearchResults>((ref) {
  final query = ref.watch(searchQueryProvider).trim().toLowerCase();

  if (query.isEmpty) {
    return SearchResults(
      characters: [],
      fruits: [],
      locations: [],
      arcs: [],
      chapters: [],
    );
  }

  // Fetch all data
  final allCharacters = ref.watch(allCharactersProvider);
  final allFruits = ref.watch(allDevilFruitsProvider);
  final allLocations = ref.watch(allLocationsProvider);
  final allArcs = ref.watch(arcsProvider);
  final allChapters = ref.watch(allChaptersProvider);

  // Filter each type
  final characters = allCharacters.where((c) {
    return c.name.toLowerCase().contains(query) ||
        c.role.toLowerCase().contains(query) ||
        c.affiliation.toLowerCase().contains(query);
  }).toList();

  final fruits = allFruits.where((f) {
    return f.name.toLowerCase().contains(query) ||
        f.type.toLowerCase().contains(query) ||
        (f.user?.toLowerCase().contains(query) ?? false);
  }).toList();

  final locations = allLocations.where((l) {
    return l.name.toLowerCase().contains(query) ||
        l.sea.toLowerCase().contains(query);
  }).toList();

  final arcs = allArcs.where((a) {
    return a.name.toLowerCase().contains(query) ||
        a.saga.toLowerCase().contains(query);
  }).toList();

  final chapters = allChapters.where((ch) {
    return ch.title.toLowerCase().contains(query) ||
        ch.number.toString().contains(query);
  }).toList();

  return SearchResults(
    characters: characters,
    fruits: fruits,
    locations: locations,
    arcs: arcs,
    chapters: chapters,
  );
});
