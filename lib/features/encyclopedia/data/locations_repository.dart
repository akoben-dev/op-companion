// lib/features/encyclopedia/data/locations_repository.dart
import '../domain/models/location.dart';

class LocationsRepository {
  const LocationsRepository();

  List<Location> getAllLocations() {
    return const [
      // East Blue
      Location(
        id: 'dawn_island',
        name: 'Dawn Island (Foosha Village)',
        sea: 'East Blue',
        description: 'A peaceful island in the Goa Kingdom where Luffy grew up. Foosha Village is a small port town where Luffy met Shanks and ate the Gomu Gomu no Mi, setting his journey in motion.',
        notableResidents: 'Monkey D. Luffy, Shanks, Makino, Woop Slap',
        firstAppearanceArc: 'romance_dawn',
      ),
      Location(
        id: 'shells_town',
        name: 'Shells Town',
        sea: 'East Blue',
        description: 'A Marine base town where Roronoa Zoro was imprisoned by the corrupt Captain Morgan. Luffy freed Zoro here, making him the first member of the Straw Hat Pirates.',
        notableResidents: 'Roronoa Zoro, Captain Morgan, Helmeppo',
        firstAppearanceArc: 'romance_dawn',
      ),
      Location(
        id: 'orange_town',
        name: 'Orange Town',
        sea: 'East Blue',
        description: 'A town terrorized by Buggy the Clown and his pirate crew. The residents fled, leaving only the mayor Boodle to defend it. This is where Nami first temporarily joined Luffy.',
        notableResidents: 'Buggy, Boodle',
        firstAppearanceArc: 'orange_town',
      ),
      Location(
        id: 'syrup_village',
        name: 'Syrup Village',
        sea: 'East Blue',
        description: 'Usopp\'s hometown, a peaceful village where the wealthy Kaya lives. Captain Kuro plotted to take over Kaya\'s fortune, but the Straw Hats stopped him. The Going Merry was gifted here.',
        notableResidents: 'Usopp, Kaya, Merry',
        firstAppearanceArc: 'syrup_village',
      ),
      Location(
        id: 'baratie',
        name: 'Baratie',
        sea: 'East Blue',
        description: 'A floating restaurant on the sea run by Chef Zeff. Sanji worked here as a sous chef before joining the Straw Hats. Mihawk made his first appearance here, pursuing Don Krieg.',
        notableResidents: 'Sanji, Zeff, Patty, Carne',
        firstAppearanceArc: 'baratie',
      ),
      Location(
        id: 'cocoyasi_village',
        name: 'Cocoyasi Village (Arlong Park)',
        sea: 'East Blue',
        description: 'Nami\'s hometown in the Conomi Islands, oppressed by the Fish-Man pirate Arlong for years. Arlong Park was his fortress base where he forced Nami to create maps for him.',
        notableResidents: 'Nami, Nojiko, Genzo, Arlong',
        firstAppearanceArc: 'arlong_park',
      ),
      Location(
        id: 'loguetown',
        name: 'Loguetown',
        sea: 'East Blue',
        description: 'The town of beginnings and endings, where Gol D. Roger was born and executed. The last island before the Grand Line entrance. Smoker and Tashigi are stationed here.',
        notableResidents: 'Smoker, Tashigi, Ipponmatsu',
        firstAppearanceArc: 'loguetown',
      ),

      // Paradise (First Half of Grand Line)
      Location(
        id: 'reverse_mountain',
        name: 'Reverse Mountain',
        sea: 'Grand Line Entrance',
        description: 'The entrance to the Grand Line where five seas converge and water flows upward. At its base lives Laboon, a giant whale waiting for his crew to return.',
        notableResidents: 'Laboon, Crocus',
        firstAppearanceArc: 'reverse_mountain',
      ),
      Location(
        id: 'whiskey_peak',
        name: 'Whiskey Peak',
        sea: 'Paradise',
        description: 'The first island on the Grand Line, secretly a base for Baroque Works bounty hunters. The crew was welcomed warmly only to be ambushed, revealing the organization\'s existence.',
        notableResidents: 'Igaram, Mr. 9, Miss Wednesday (Vivi)',
        firstAppearanceArc: 'reverse_mountain',
      ),
      Location(
        id: 'little_garden',
        name: 'Little Garden',
        sea: 'Paradise',
        description: 'A prehistoric island inhabited by dinosaurs and two giant warriors, Dorry and Brogy, who have been dueling for 100 years to settle a forgotten argument.',
        notableResidents: 'Dorry, Brogy',
        firstAppearanceArc: 'little_garden',
      ),
      Location(
        id: 'drum_island',
        name: 'Drum Island (Sakura Kingdom)',
        sea: 'Paradise',
        description: 'A winter island known for its advanced medicine. Once ruled by the tyrannical King Wapol, it became the Sakura Kingdom after his defeat. Chopper\'s homeland.',
        notableResidents: 'Tony Tony Chopper, Dr. Kureha, Dalton, Wapol',
        firstAppearanceArc: 'drum_island',
      ),
      Location(
        id: 'alabasta',
        name: 'Alabasta Kingdom',
        sea: 'Paradise',
        description: 'A vast desert kingdom plagued by drought and civil war orchestrated by Crocodile and Baroque Works. The Straw Hats helped Princess Vivi save her nation from destruction.',
        notableResidents: 'Nefertari Vivi, Nefertari Cobra, Crocodile, Pell, Chaka',
        firstAppearanceArc: 'alabasta',
      ),
      Location(
        id: 'jaya',
        name: 'Jaya',
        sea: 'Paradise',
        description: 'A lawless island split in half centuries ago. The remaining piece is home to pirates and criminals. Here the crew learned about Sky Island and met Blackbeard.',
        notableResidents: 'Bellamy, Blackbeard, Shoujou',
        firstAppearanceArc: 'jaya',
      ),
      Location(
        id: 'skypiea',
        name: 'Skypiea',
        sea: 'Sky Island',
        description: 'An island in the clouds 10,000 meters above the sea, ruled by the self-proclaimed god Enel. Home to the Shandians and the legendary Golden Bell.',
        notableResidents: 'Enel, Gan Fall, Wyper, Conis',
        firstAppearanceArc: 'skypiea',
      ),
      Location(
        id: 'water_seven',
        name: 'Water 7',
        sea: 'Paradise',
        description: 'A water city famous for shipbuilding, home of the Galley-La Company and the legendary shipwright Tom. The Going Merry was deemed unsalvageable here, and CP9 was revealed.',
        notableResidents: 'Franky, Iceburg, Paulie, Tom',
        firstAppearanceArc: 'water_seven',
      ),
      Location(
        id: 'enies_lobby',
        name: 'Enies Lobby',
        sea: 'Paradise',
        description: 'The judicial island of the World Government where criminals are sent for sentencing. Never experiences night. The Straw Hats declared war on the World Government here.',
        notableResidents: 'Rob Lucci, Spandam, Funkfreed',
        firstAppearanceArc: 'enies_lobby',
      ),
      Location(
        id: 'thriller_bark',
        name: 'Thriller Bark',
        sea: 'Paradise (Florian Triangle)',
        description: 'The world\'s largest pirate ship, captained by Gecko Moria. Shrouded in fog and filled with zombies animated by stolen shadows. Brook was rescued here.',
        notableResidents: 'Gecko Moria, Brook, Perona, Absalom',
        firstAppearanceArc: 'thriller_bark',
      ),
      Location(
        id: 'sabaody',
        name: 'Sabaody Archipelago',
        sea: 'Paradise',
        description: 'An archipelago of massive mangrove trees near the Red Line. Infamous for slave auctions and Celestial Dragons. The crew was scattered here by Bartholomew Kuma.',
        notableResidents: 'Silvers Rayleigh, Shakky, Duval',
        firstAppearanceArc: 'sabaody',
      ),

      // Special Locations
      Location(
        id: 'amazon_lily',
        name: 'Amazon Lily',
        sea: 'Calm Belt',
        description: 'An island nation of warrior women in the Calm Belt, led by Empress Boa Hancock. Men are forbidden from entering. Luffy landed here after being sent away by Kuma.',
        notableResidents: 'Boa Hancock, Gloriosa, Marguerite',
        firstAppearanceArc: 'amazon_lily',
      ),
      Location(
        id: 'impel_down',
        name: 'Impel Down',
        sea: 'Calm Belt',
        description: 'The world\'s greatest underwater prison with six levels of increasing brutality. Luffy infiltrated it to rescue Ace, leading to a massive breakout.',
        notableResidents: 'Magellan, Hannyabal, Sadi',
        firstAppearanceArc: 'impel_down',
      ),
      Location(
        id: 'marineford',
        name: 'Marineford',
        sea: 'Grand Line',
        description: 'The former headquarters of the Marines and the stage for the Paramount War. Ace was executed here, and Whitebeard died protecting his crew.',
        notableResidents: 'Sengoku, Garp, Tsuru',
        firstAppearanceArc: 'marineford',
      ),

      // New World
      Location(
        id: 'fishman_island',
        name: 'Fish-Man Island',
        sea: 'Underwater (entrance to New World)',
        description: 'An underwater kingdom 10,000 meters below the surface, protected by a massive bubble. Home to Fish-Men and Merfolk, and gateway to the New World.',
        notableResidents: 'Jinbe, King Neptune, Shirahoshi, Hody Jones',
        firstAppearanceArc: 'fishman_island',
      ),
      Location(
        id: 'punk_hazard',
        name: 'Punk Hazard',
        sea: 'New World',
        description: 'A former government research island split between burning flames and freezing ice due to a battle between Aokiji and Akainu. Caesar Clown conducted experiments here.',
        notableResidents: 'Caesar Clown, Monet, Vergo',
        firstAppearanceArc: 'punk_hazard',
      ),
      Location(
        id: 'dressrosa',
        name: 'Dressrosa',
        sea: 'New World',
        description: 'The Kingdom of Love and Passion, secretly ruled by Donquixote Doflamingo through manipulation. Citizens were turned into toys and forgotten. The Colosseum hosted battles for the Mera Mera no Mi.',
        notableResidents: 'Donquixote Doflamingo, Rebecca, Kyros, Riku Doldo III',
        firstAppearanceArc: 'dressrosa',
      ),
      Location(
        id: 'zou',
        name: 'Zou',
        sea: 'New World',
        description: 'A living elephant island that has walked the seas for 1000 years. Home to the Mink Tribe, who live in the Mokomo Dukedom on its back.',
        notableResidents: 'Inuarashi, Nekomamushi, Carrot, Pedro',
        firstAppearanceArc: 'zou',
      ),
      Location(
        id: 'whole_cake_island',
        name: 'Whole Cake Island (Totto Land)',
        sea: 'New World',
        description: 'Big Mom\'s territory composed of 34 islands, each themed around different sweets and ingredients. The main island houses her candy-filled castle and living homies.',
        notableResidents: 'Charlotte Linlin, Charlotte Katakuri, Charlotte Pudding',
        firstAppearanceArc: 'whole_cake_island',
      ),
      Location(
        id: 'wano',
        name: 'Wano Country',
        sea: 'New World',
        description: 'An isolated samurai nation with a rich history and unique culture. Controlled by Kaido and Orochi until the Onigashima raid. Known for its skilled swordsmiths and warriors.',
        notableResidents: 'Kaido, Kozuki Momonosuke, Yamato, Kin\'emon',
        firstAppearanceArc: 'wano',
      ),
      Location(
        id: 'egghead',
        name: 'Egghead Island',
        sea: 'New World',
        description: 'The island of the future, home to Dr. Vegapunk\'s advanced research laboratories. Features futuristic technology 500 years ahead of the rest of the world.',
        notableResidents: 'Dr. Vegapunk, Sentomaru, Stussy',
        firstAppearanceArc: 'egghead',
      ),
      Location(
        id: 'elbaf',
        name: 'Elbaf',
        sea: 'New World',
        description: 'The legendary warrior nation of giants, the strongest country in the world. Usopp has dreamed of visiting since he was a child. Home to legendary warriors like Dorry and Brogy.',
        notableResidents: 'Loki, Dorry, Brogy',
        firstAppearanceArc: 'elbaf',
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
