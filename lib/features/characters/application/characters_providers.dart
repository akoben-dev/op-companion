import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/characters_repository.dart';
import '../domain/models/character.dart';

final charactersRepositoryProvider = Provider<CharactersRepository>((ref) {
  return const CharactersRepository();
});

final allCharactersProvider = Provider<List<Character>>((ref) {
  final repo = ref.watch(charactersRepositoryProvider);
  return repo.getAllCharacters();
});

final characterByIdProvider =
    Provider.family<Character?, String>((ref, id) {
  final repo = ref.watch(charactersRepositoryProvider);
  return repo.getById(id);
});

// current search text for characters list
final charactersSearchQueryProvider = StateProvider<String>((ref) => '');

// derived, filtered list
final filteredCharactersProvider = Provider<List<Character>>((ref) {
  final query = ref.watch(charactersSearchQueryProvider).trim().toLowerCase();
  final all = ref.watch(allCharactersProvider);

  if (query.isEmpty) return all;

  return all.where((c) {
    final name = c.name.toLowerCase();
    final role = c.role.toLowerCase();
    final affiliation = c.affiliation.toLowerCase();
    return name.contains(query) ||
        role.contains(query) ||
        affiliation.contains(query);
  }).toList();
});
