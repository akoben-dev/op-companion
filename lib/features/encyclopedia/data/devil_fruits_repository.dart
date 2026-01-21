// lib/features/encyclopedia/data/devil_fruits_repository.dart
import '../domain/models/devil_fruit.dart';

class DevilFruitsRepository {
  const DevilFruitsRepository();

  List<DevilFruit> getAllFruits() {
    return const [
      DevilFruit(
        id: 'gomu_gomu',
        name: 'Gomu Gomu no Mi / Hito Hito no Mi, Model: Nika',
        type: 'Zoan',
        subType: 'Mythical Zoan',
        description:
            'A special Zoan fruit that grants a rubber-like body and the power of the Sun God, Nika.',
        user: 'Monkey D. Luffy',
        firstAppearanceArc: 'Romance Dawn',
      ),
      DevilFruit(
        id: 'goro_goro',
        name: 'Goro Goro no Mi',
        type: 'Logia',
        subType: null,
        description:
            'Allows the user to create, control, and transform into lightning.',
        user: 'Enel',
        firstAppearanceArc: 'Skypiea',
      ),
      DevilFruit(
        id: 'mera_mera',
        name: 'Mera Mera no Mi',
        type: 'Logia',
        subType: null,
        description:
            'Allows the user to create, control, and transform into fire.',
        user: 'Portgas D. Ace / Sabo',
        firstAppearanceArc: 'Alabasta / Dressrosa',
      ),
      DevilFruit(
        id: 'gura_gura',
        name: 'Gura Gura no Mi',
        type: 'Paramecia',
        subType: null,
        description:
            'Allows the user to create powerful shockwaves capable of quakes.',
        user: 'Edward Newgate (Whitebeard) / Marshall D. Teach (Blackbeard)',
        firstAppearanceArc: 'Marineford',
      ),
      DevilFruit(
        id: 'yami_yami',
        name: 'Yami Yami no Mi',
        type: 'Logia',
        subType: null,
        description:
            'Allows the user to create and control darkness that can absorb anything.',
        user: 'Marshall D. Teach (Blackbeard)',
        firstAppearanceArc: 'Jaya',
      ),
      DevilFruit(
        id: 'hito_hito',
        name: 'Hito Hito no Mi',
        type: 'Zoan',
        subType: 'Regular Zoan',
        description:
            'Allows the user to transform into a human or human hybrid.',
        user: 'Tony Tony Chopper',
        firstAppearanceArc: 'Drum Island',
      ),
      DevilFruit(
        id: 'hana_hana',
        name: 'Hana Hana no Mi',
        type: 'Paramecia',
        subType: null,
        description:
            'Allows the user to sprout extra limbs or body parts on any surface.',
        user: 'Nico Robin',
        firstAppearanceArc: 'Whiskey Peak / Alabasta',
      ),
      DevilFruit(
        id: 'ope_ope',
        name: 'Ope Ope no Mi',
        type: 'Paramecia',
        subType: null,
        description:
            'Allows the user to create a room where they can manipulate anything inside.',
        user: 'Trafalgar D. Water Law',
        firstAppearanceArc: 'Sabaody Archipelago',
      ),
      DevilFruit(
        id: 'nikyu_nikyu',
        name: 'Nikyu Nikyu no Mi',
        type: 'Paramecia',
        subType: null,
        description:
            'Gives paw pads that can repel anything they touch, including pain and fatigue.',
        user: 'Bartholomew Kuma',
        firstAppearanceArc: 'Thriller Bark',
      ),
      DevilFruit(
        id: 'magu_magu',
        name: 'Magu Magu no Mi',
        type: 'Logia',
        subType: null,
        description:
            'Allows the user to create, control, and transform into magma.',
        user: 'Sakazuki (Akainu)',
        firstAppearanceArc: 'Marineford',
      ),
    ];
  }

  DevilFruit? getById(String id) {
    final all = getAllFruits();
    try {
      return all.firstWhere((f) => f.id == id);
    } catch (_) {
      return null;
    }
  }
}
