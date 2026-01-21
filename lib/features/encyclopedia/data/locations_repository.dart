// lib/features/encyclopedia/data/locations_repository.dart
import '../domain/models/location.dart';

class LocationsRepository {
  const LocationsRepository();

  List<Location> getAllLocations() {
    return const [
      Location(
        id: 'foosha',
        name: 'Foosha Village',
        sea: 'East Blue',
        description:
            'A small village on Dawn Island where Luffy grew up, birthplace of the Great Pirate Era for him.',
        keyArcs: 'Romance Dawn',
      ),
      Location(
        id: 'loguetown',
        name: 'Loguetown',
        sea: 'East Blue',
        description:
            'The city of beginnings and endings, where Gold Roger was born and executed.',
        keyArcs: 'Loguetown',
      ),
      Location(
        id: 'arlong_park',
        name: 'Arlong Park',
        sea: 'East Blue',
        description:
            'The base of Arlong\'s pirate crew in the Conomi Islands, where Nami\'s tragic past unfolds.',
        keyArcs: 'Arlong Park',
      ),
      Location(
        id: 'alabasta',
        name: 'Alabasta Kingdom',
        sea: 'Grand Line',
        description:
            'A desert kingdom plagued by drought and civil war, where Baroque Works plots behind the scenes.',
        keyArcs: 'Alabasta',
      ),
      Location(
        id: 'water7',
        name: 'Water 7',
        sea: 'Grand Line',
        description:
            'A city of shipwrights built on water, home of the legendary Galley-La Company.',
        keyArcs: 'Water 7, Enies Lobby',
      ),
      Location(
        id: 'thriller_bark',
        name: 'Thriller Bark',
        sea: 'Florian Triangle (Grand Line)',
        description:
            'The giant ship-island ruled by Gecko Moria, shrouded in fog and filled with zombies.',
        keyArcs: 'Thriller Bark',
      ),
      Location(
        id: 'sabaody',
        name: 'Sabaody Archipelago',
        sea: 'Grand Line',
        description:
            'An archipelago of mangrove islands near the Red Line, infamous for slave auctions and Celestial Dragons.',
        keyArcs: 'Sabaody Archipelago',
      ),
      Location(
        id: 'marineford',
        name: 'Marineford',
        sea: 'Grand Line',
        description:
            'The former headquarters of the Marines and the stage for the Paramount War.',
        keyArcs: 'Marineford',
      ),
      Location(
        id: 'fishman_island',
        name: 'Fish-Man Island',
        sea: 'Grand Line',
        description:
            'An underwater island 10,000 meters below the surface and gateway to the New World.',
        keyArcs: 'Fish-Man Island',
      ),
      Location(
        id: 'punk_hazard',
        name: 'Punk Hazard',
        sea: 'New World',
        description:
            'A former government research island split between burning and freezing climates.',
        keyArcs: 'Punk Hazard',
      ),
      Location(
        id: 'dressrosa',
        name: 'Dressrosa',
        sea: 'New World',
        description:
            'A kingdom ruled by Donquixote Doflamingo, filled with living toys and dark secrets.',
        keyArcs: 'Dressrosa',
      ),
      Location(
        id: 'whole_cake',
        name: 'Whole Cake Island',
        sea: 'New World',
        description:
            'The candy-colored stronghold of Big Mom, one of the Four Emperors.',
        keyArcs: 'Whole Cake Island',
      ),
      Location(
        id: 'wano',
        name: 'Wano Country',
        sea: 'New World',
        description:
            'A closed-off samurai nation with a rich history, ruled by Kaido and Orochi until the Onigashima raid.',
        keyArcs: 'Wano Country',
      ),
      Location(
        id: 'egghead',
        name: 'Egghead',
        sea: 'New World',
        description:
            'The island of the future where Dr. Vegapunk’s research labs are located.',
        keyArcs: 'Egghead',
      ),
    ];
  }

  Location? getById(String id) {
    final all = getAllLocations();
    try {
      return all.firstWhere((loc) => loc.id == id);
    } catch (_) {
      return null;
    }
  }
}
