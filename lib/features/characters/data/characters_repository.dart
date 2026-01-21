import '../domain/models/character.dart';

class CharactersRepository {
  const CharactersRepository();

  // Expanded sample: Straw Hats + a few major others
  List<Character> getAllCharacters() {
    return const [
      Character(
        id: 'luffy',
        name: 'Monkey D. Luffy',
        role: 'Captain',
        affiliation: 'Straw Hat Pirates',
        bounty: 3000000000,
        devilFruit: 'Gomu Gomu no Mi / Hito Hito no Mi, Model: Nika',
        firstAppearanceArc: 'Romance Dawn',
      ),
      Character(
        id: 'zoro',
        name: 'Roronoa Zoro',
        role: 'Swordsman',
        affiliation: 'Straw Hat Pirates',
        bounty: 1111000000,
        devilFruit: null,
        firstAppearanceArc: 'Romance Dawn',
      ),
      Character(
        id: 'nami',
        name: 'Nami',
        role: 'Navigator',
        affiliation: 'Straw Hat Pirates',
        bounty: 366000000,
        devilFruit: null,
        firstAppearanceArc: 'Orange Town',
      ),
      Character(
        id: 'usopp',
        name: 'Usopp',
        role: 'Sniper',
        affiliation: 'Straw Hat Pirates',
        bounty: 500000000,
        devilFruit: null,
        firstAppearanceArc: 'Syrup Village',
      ),
      Character(
        id: 'sanji',
        name: 'Vinsmoke Sanji',
        role: 'Cook',
        affiliation: 'Straw Hat Pirates',
        bounty: 1032000000,
        devilFruit: null,
        firstAppearanceArc: 'Baratie',
      ),
      Character(
        id: 'chopper',
        name: 'Tony Tony Chopper',
        role: 'Doctor',
        affiliation: 'Straw Hat Pirates',
        bounty: 1000,
        devilFruit: 'Hito Hito no Mi',
        firstAppearanceArc: 'Drum Island',
      ),
      Character(
        id: 'robin',
        name: 'Nico Robin',
        role: 'Archaeologist',
        affiliation: 'Straw Hat Pirates',
        bounty: 930000000,
        devilFruit: 'Hana Hana no Mi',
        firstAppearanceArc: 'Whiskey Peak / Alabasta',
      ),
      Character(
        id: 'franky',
        name: 'Franky',
        role: 'Shipwright',
        affiliation: 'Straw Hat Pirates',
        bounty: 394000000,
        devilFruit: null,
        firstAppearanceArc: 'Water 7',
      ),
      Character(
        id: 'brook',
        name: 'Brook',
        role: 'Musician',
        affiliation: 'Straw Hat Pirates',
        bounty: 383000000,
        devilFruit: 'Yomi Yomi no Mi',
        firstAppearanceArc: 'Thriller Bark',
      ),
      Character(
        id: 'jinbe',
        name: 'Jinbe',
        role: 'Helmsman',
        affiliation: 'Straw Hat Pirates',
        bounty: 1100000000,
        devilFruit: null,
        firstAppearanceArc: 'Arlong Park / Impel Down',
      ),

      // A few major non-Straw Hat examples
      Character(
        id: 'shanks',
        name: 'Shanks',
        role: 'Captain',
        affiliation: 'Red-Haired Pirates',
        bounty: 4048900000,
        devilFruit: null,
        firstAppearanceArc: 'Romance Dawn',
      ),
      Character(
        id: 'whitebeard',
        name: 'Edward Newgate (Whitebeard)',
        role: 'Captain',
        affiliation: 'Whitebeard Pirates',
        bounty: 5046000000,
        devilFruit: 'Gura Gura no Mi',
        firstAppearanceArc: 'Jaya',
      ),
      Character(
        id: 'ace',
        name: 'Portgas D. Ace',
        role: '2nd Division Commander',
        affiliation: 'Whitebeard Pirates',
        bounty: 550000000,
        devilFruit: 'Mera Mera no Mi',
        firstAppearanceArc: 'Drum / Alabasta',
      ),
      Character(
        id: 'smoker',
        name: 'Smoker',
        role: 'Marine Officer',
        affiliation: 'Marines',
        bounty: null,
        devilFruit: 'Moku Moku no Mi',
        firstAppearanceArc: 'Loguetown',
      ),
      Character(
        id: 'mihawk',
        name: 'Dracule Mihawk',
        role: 'Warlord / Swordsman',
        affiliation: 'Former Seven Warlords',
        bounty: null,
        devilFruit: null,
        firstAppearanceArc: 'Baratie',
      ),
    ];
  }

  Character? getById(String id) {
    final all = getAllCharacters();
    try {
      return all.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }
}
