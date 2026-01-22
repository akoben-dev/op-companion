// lib/features/encyclopedia/data/devil_fruits_repository.dart
import '../domain/models/devil_fruit.dart';

class DevilFruitsRepository {
  const DevilFruitsRepository();

  // Change this later to your real CDN base, e.g. https://cdn.yourapp.com/op
  static const String cdnBase = 'https://example.com/op';

  String _fruitImage(String id) => '$cdnBase/devil_fruits/$id.jpg';

  List<DevilFruit> getAllFruits() {
    return [
      // Paramecia
      DevilFruit(
        id: 'gomu',
        name: 'Gomu Gomu no Mi (Hito Hito no Mi, Model: Nika)',
        type: 'Paramecia',
        subType: 'Mythical Zoan',
        description: 'Grants rubber body properties and awakens as Sun God Nika.',
        user: 'Monkey D. Luffy',
        firstAppearanceArc: 'Romance Dawn',
        imageUrl: _fruitImage('gomu'),
      ),
      DevilFruit(
        id: 'hana',
        name: 'Hana Hana no Mi',
        type: 'Paramecia',
        description: 'Allows the user to sprout body parts on any surface.',
        user: 'Nico Robin',
        firstAppearanceArc: 'Alabasta',
        imageUrl: _fruitImage('hana'),
      ),
      DevilFruit(
        id: 'ope',
        name: 'Ope Ope no Mi',
        type: 'Paramecia',
        description: 'Creates a spherical "ROOM" where the user can manipulate anything.',
        user: 'Trafalgar D. Water Law',
        firstAppearanceArc: 'Sabaody Archipelago',
        imageUrl: _fruitImage('ope'),
      ),

      // Keep rest as-is, but remove imageUrl for those you haven't uploaded yet
      const DevilFruit(
        id: 'mera',
        name: 'Mera Mera no Mi',
        type: 'Logia',
        description: 'Transforms the user into fire and controls flames.',
        user: 'Sabo (formerly Portgas D. Ace)',
        firstAppearanceArc: 'Alabasta',
      ),
      const DevilFruit(
        id: 'gura',
        name: 'Gura Gura no Mi',
        type: 'Paramecia',
        description: 'Grants the power to create earthquakes and shockwaves.',
        user: 'Marshall D. Teach (formerly Edward Newgate)',
        firstAppearanceArc: 'Jaya',
      ),
      const DevilFruit(
        id: 'yami',
        name: 'Yami Yami no Mi',
        type: 'Logia',
        description: 'Controls darkness and can nullify other Devil Fruit powers.',
        user: 'Marshall D. Teach',
        firstAppearanceArc: 'Jaya',
      ),
      const DevilFruit(
        id: 'suna',
        name: 'Suna Suna no Mi',
        type: 'Logia',
        description: 'Transforms the user into sand and controls it.',
        user: 'Crocodile',
        firstAppearanceArc: 'Alabasta',
      ),
      const DevilFruit(
        id: 'moku',
        name: 'Moku Moku no Mi',
        type: 'Logia',
        description: 'Allows the user to create, control, and transform into smoke.',
        user: 'Smoker',
        firstAppearanceArc: 'Loguetown',
      ),
      const DevilFruit(
        id: 'goro',
        name: 'Goro Goro no Mi',
        type: 'Logia',
        description: 'Grants control over lightning and transformation into electricity.',
        user: 'Enel',
        firstAppearanceArc: 'Skypiea',
      ),
      const DevilFruit(
        id: 'pika',
        name: 'Pika Pika no Mi',
        type: 'Logia',
        description: 'Allows the user to become and control light.',
        user: 'Borsalino (Kizaru)',
        firstAppearanceArc: 'Sabaody Archipelago',
      ),
      const DevilFruit(
        id: 'magu',
        name: 'Magu Magu no Mi',
        type: 'Logia',
        description: 'Transforms the user into magma.',
        user: 'Sakazuki (Akainu)',
        firstAppearanceArc: 'Jaya',
      ),
      const DevilFruit(
        id: 'hie',
        name: 'Hie Hie no Mi',
        type: 'Logia',
        description: 'Allows the user to create, control, and become ice.',
        user: 'Kuzan (Aokiji)',
        firstAppearanceArc: 'Long Ring Long Land',
      ),
      const DevilFruit(
        id: 'yomi',
        name: 'Yomi Yomi no Mi',
        type: 'Paramecia',
        description: 'Grants a second life and allows the soul to leave the body.',
        user: 'Brook',
        firstAppearanceArc: 'Thriller Bark',
      ),
      const DevilFruit(
        id: 'hito_human',
        name: 'Hito Hito no Mi',
        type: 'Zoan',
        description: 'Allows an animal to transform into a human.',
        user: 'Tony Tony Chopper',
        firstAppearanceArc: 'Drum Island',
      ),
      const DevilFruit(
        id: 'uo_seiryu',
        name: 'Uo Uo no Mi, Model: Seiryu',
        type: 'Zoan',
        subType: 'Mythical Zoan',
        description: 'Transforms the user into an Azure Dragon.',
        user: 'Kaido',
        firstAppearanceArc: 'Zou',
      ),
      const DevilFruit(
        id: 'inu_okuchi',
        name: 'Inu Inu no Mi, Model: Okuchi no Makami',
        type: 'Zoan',
        subType: 'Mythical Zoan',
        description: 'Transforms the user into a Guardian Deity wolf.',
        user: 'Yamato',
        firstAppearanceArc: 'Wano',
      ),
      const DevilFruit(
        id: 'soru',
        name: 'Soru Soru no Mi',
        type: 'Paramecia',
        description: 'Allows the user to interact with and manipulate souls.',
        user: 'Charlotte Linlin (Big Mom)',
        firstAppearanceArc: 'Fishman Island',
      ),
      const DevilFruit(
        id: 'mero',
        name: 'Mero Mero no Mi',
        type: 'Paramecia',
        description: 'Turns those attracted to the user into stone.',
        user: 'Boa Hancock',
        firstAppearanceArc: 'Amazon Lily',
      ),
      const DevilFruit(
        id: 'ito',
        name: 'Ito Ito no Mi',
        type: 'Paramecia',
        description: 'Grants the ability to create and control strings.',
        user: 'Donquixote Doflamingo',
        firstAppearanceArc: 'Jaya',
      ),
      const DevilFruit(
        id: 'nikyu',
        name: 'Nikyu Nikyu no Mi',
        type: 'Paramecia',
        description: 'Grants paw pads that can repel anything, including abstract concepts.',
        user: 'Bartholomew Kuma',
        firstAppearanceArc: 'Thriller Bark',
      ),
      const DevilFruit(
        id: 'mochi',
        name: 'Mochi Mochi no Mi',
        type: 'Paramecia',
        subType: 'Special Paramecia',
        description: 'Transforms the user into mochi and controls it.',
        user: 'Charlotte Katakuri',
        firstAppearanceArc: 'Whole Cake Island',
      ),
      const DevilFruit(
        id: 'kage',
        name: 'Kage Kage no Mi',
        type: 'Paramecia',
        description: 'Allows the user to manifest and control shadows.',
        user: 'Gecko Moria',
        firstAppearanceArc: 'Thriller Bark',
      ),
      const DevilFruit(
        id: 'zushi',
        name: 'Zushi Zushi no Mi',
        type: 'Paramecia',
        description: 'Grants control over gravity.',
        user: 'Issho (Fujitora)',
        firstAppearanceArc: 'Dressrosa',
      ),
      const DevilFruit(
        id: 'gasu',
        name: 'Gasu Gasu no Mi',
        type: 'Logia',
        description: 'Allows the user to create, control, and transform into gas.',
        user: 'Caesar Clown',
        firstAppearanceArc: 'Punk Hazard',
      ),
      const DevilFruit(
        id: 'neko_leopard',
        name: 'Neko Neko no Mi, Model: Leopard',
        type: 'Zoan',
        subType: 'Carnivorous Zoan',
        description: 'Transforms the user into a leopard.',
        user: 'Rob Lucci',
        firstAppearanceArc: 'Water 7',
      ),
      const DevilFruit(
        id: 'ryu_pteranodon',
        name: 'Ryu Ryu no Mi, Model: Pteranodon',
        type: 'Zoan',
        subType: 'Ancient Zoan',
        description: 'Transforms the user into a pteranodon.',
        user: 'King',
        firstAppearanceArc: 'Wano',
      ),
      const DevilFruit(
        id: 'ryu_brachiosaurus',
        name: 'Ryu Ryu no Mi, Model: Brachiosaurus',
        type: 'Zoan',
        subType: 'Ancient Zoan',
        description: 'Transforms the user into a brachiosaurus.',
        user: 'Queen',
        firstAppearanceArc: 'Wano',
      ),
      const DevilFruit(
        id: 'toshi',
        name: 'Toshi Toshi no Mi',
        type: 'Paramecia',
        description: 'Allows the user to manipulate the ages of themselves and others.',
        user: 'Jewelry Bonney',
        firstAppearanceArc: 'Sabaody Archipelago',
      ),
      const DevilFruit(
        id: 'bara',
        name: 'Bara Bara no Mi',
        type: 'Paramecia',
        description: 'Allows the user to split their body into pieces.',
        user: 'Buggy',
        firstAppearanceArc: 'Orange Town',
      ),
      const DevilFruit(
        id: 'sube',
        name: 'Sube Sube no Mi',
        type: 'Paramecia',
        description: 'Makes the user slim and makes everything slide off their body.',
        user: 'Alvida',
        firstAppearanceArc: 'Romance Dawn',
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
