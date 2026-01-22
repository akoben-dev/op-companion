// lib/features/arcs/data/arcs_repository.dart
import '../domain/models/arc.dart';

class ArcsRepository {
  const ArcsRepository();

  // Change this later to your real CDN base
  static const String cdnBase = 'https://example.com/op';

  String _arcImage(String id) => '$cdnBase/arcs/$id.jpg';

  List<Arc> getArcs() {
    return [
      // Add imageUrl only for the first few as examples (keep rest null for now)
      Arc(
        id: 'romance_dawn',
        name: 'Romance Dawn',
        saga: 'East Blue Saga',
        startChapter: 1,
        endChapter: 7,
        summary: 'Luffy begins his journey and recruits Zoro.',
        imageUrl: _arcImage('romance_dawn'),
      ),
      Arc(
        id: 'alabasta',
        name: 'Alabasta',
        saga: 'Arabasta Saga',
        startChapter: 155,
        endChapter: 217,
        summary: 'The crew battles Baroque Works to save Alabasta.',
        imageUrl: _arcImage('alabasta'),
      ),
      Arc(
        id: 'marineford',
        name: 'Marineford',
        saga: 'Summit War Saga',
        startChapter: 550,
        endChapter: 580,
        summary: 'The war at Marineford determines the fate of Ace and Whitebeard.',
        imageUrl: _arcImage('marineford'),
      ),

      // Keep the rest as const without imageUrl
      const Arc(
        id: 'orange_town',
        name: 'Orange Town',
        saga: 'East Blue Saga',
        startChapter: 8,
        endChapter: 21,
        summary: 'Luffy and Zoro encounter Buggy the Clown and meet Nami.',
      ),
      const Arc(
        id: 'syrup_village',
        name: 'Syrup Village',
        saga: 'East Blue Saga',
        startChapter: 22,
        endChapter: 41,
        summary: 'The crew meets Usopp and battles Captain Kuro.',
      ),
      const Arc(
        id: 'baratie',
        name: 'Baratie',
        saga: 'East Blue Saga',
        startChapter: 42,
        endChapter: 68,
        summary: 'Sanji joins the crew, and Mihawk appears.',
      ),
      const Arc(
        id: 'arlong_park',
        name: 'Arlong Park',
        saga: 'East Blue Saga',
        startChapter: 69,
        endChapter: 95,
        summary: 'Nami\'s past is revealed and Arlong is defeated.',
      ),
      const Arc(
        id: 'loguetown',
        name: 'Loguetown',
        saga: 'East Blue Saga',
        startChapter: 96,
        endChapter: 100,
        summary: 'The crew prepares for the Grand Line and encounters Smoker.',
      ),
      const Arc(
        id: 'reverse_mountain',
        name: 'Reverse Mountain / Whiskey Peak',
        saga: 'Arabasta Saga',
        startChapter: 101,
        endChapter: 114,
        summary: 'The crew enters the Grand Line and meets Vivi.',
      ),
      const Arc(
        id: 'little_garden',
        name: 'Little Garden',
        saga: 'Arabasta Saga',
        startChapter: 115,
        endChapter: 129,
        summary: 'The crew meets the giants Dorry and Brogy.',
      ),
      const Arc(
        id: 'drum_island',
        name: 'Drum Island',
        saga: 'Arabasta Saga',
        startChapter: 130,
        endChapter: 154,
        summary: 'Chopper joins the crew after defeating Wapol.',
      ),
      const Arc(
        id: 'jaya',
        name: 'Jaya',
        saga: 'Sky Island Saga',
        startChapter: 218,
        endChapter: 236,
        summary: 'The crew learns about Sky Island and meets Blackbeard.',
      ),
      const Arc(
        id: 'skypiea',
        name: 'Skypiea',
        saga: 'Sky Island Saga',
        startChapter: 237,
        endChapter: 302,
        summary: 'The crew explores the sky island and battles Enel.',
      ),
      const Arc(
        id: 'long_ring_long_land',
        name: 'Long Ring Long Land',
        saga: 'Water 7 Saga',
        startChapter: 303,
        endChapter: 321,
        summary: 'The crew participates in the Davy Back Fight and meets Aokiji.',
      ),
      const Arc(
        id: 'water_seven',
        name: 'Water 7',
        saga: 'Water 7 Saga',
        startChapter: 322,
        endChapter: 374,
        summary: 'Robin leaves the crew and CP9 is revealed.',
      ),
      const Arc(
        id: 'enies_lobby',
        name: 'Enies Lobby',
        saga: 'Water 7 Saga',
        startChapter: 375,
        endChapter: 430,
        summary: 'The crew storms Enies Lobby to rescue Robin.',
      ),
      const Arc(
        id: 'post_enies_lobby',
        name: 'Post-Enies Lobby',
        saga: 'Water 7 Saga',
        startChapter: 431,
        endChapter: 441,
        summary: 'The crew receives new bounties and meets Garp.',
      ),
      const Arc(
        id: 'thriller_bark',
        name: 'Thriller Bark',
        saga: 'Thriller Bark Saga',
        startChapter: 442,
        endChapter: 489,
        summary: 'Brook joins and the crew battles Gecko Moria.',
      ),
      const Arc(
        id: 'sabaody',
        name: 'Sabaody Archipelago',
        saga: 'Summit War Saga',
        startChapter: 490,
        endChapter: 513,
        summary: 'The crew is scattered by Kuma and meets the Eleven Supernovas.',
      ),
      const Arc(
        id: 'amazon_lily',
        name: 'Amazon Lily',
        saga: 'Summit War Saga',
        startChapter: 514,
        endChapter: 524,
        summary: 'Luffy lands on Amazon Lily and meets Boa Hancock.',
      ),
      const Arc(
        id: 'impel_down',
        name: 'Impel Down',
        saga: 'Summit War Saga',
        startChapter: 525,
        endChapter: 549,
        summary: 'Luffy infiltrates the underwater prison to rescue Ace.',
      ),
      const Arc(
        id: 'post_war',
        name: 'Post-War',
        saga: 'Summit War Saga',
        startChapter: 581,
        endChapter: 597,
        summary: 'Luffy mourns Ace and the crew begins the two-year timeskip.',
      ),
      const Arc(
        id: 'return_to_sabaody',
        name: 'Return to Sabaody',
        saga: 'Fish-Man Island Saga',
        startChapter: 598,
        endChapter: 602,
        summary: 'The crew reunites after two years.',
      ),
      const Arc(
        id: 'fishman_island',
        name: 'Fishman Island',
        saga: 'Fish-Man Island Saga',
        startChapter: 603,
        endChapter: 653,
        summary: 'The crew reunites and heads to Fishman Island.',
      ),
      const Arc(
        id: 'punk_hazard',
        name: 'Punk Hazard',
        saga: 'Dressrosa Saga',
        startChapter: 654,
        endChapter: 699,
        summary: 'The crew allies with Law to take down Doflamingo and Kaido.',
      ),
      const Arc(
        id: 'dressrosa',
        name: 'Dressrosa',
        saga: 'Dressrosa Saga',
        startChapter: 700,
        endChapter: 801,
        summary: 'Luffy wins the Mera Mera no Mi tournament and defeats Doflamingo.',
      ),
      const Arc(
        id: 'zou',
        name: 'Zou',
        saga: 'Whole Cake Island Saga',
        startChapter: 802,
        endChapter: 824,
        summary: 'The crew learns about the Road Poneglyphs and Sanji\'s past.',
      ),
      const Arc(
        id: 'whole_cake_island',
        name: 'Whole Cake Island',
        saga: 'Whole Cake Island Saga',
        startChapter: 825,
        endChapter: 902,
        summary: 'Luffy infiltrates Big Mom\'s territory to rescue Sanji.',
      ),
      const Arc(
        id: 'levely',
        name: 'Levely',
        saga: 'Whole Cake Island Saga',
        startChapter: 903,
        endChapter: 908,
        summary: 'World leaders gather for the Reverie.',
      ),
      const Arc(
        id: 'wano',
        name: 'Wano Country',
        saga: 'Wano Country Saga',
        startChapter: 909,
        endChapter: 1057,
        summary: 'The alliance battles Kaido and Big Mom in the largest war yet.',
      ),
      const Arc(
        id: 'egghead',
        name: 'Egghead',
        saga: 'Final Saga',
        startChapter: 1058,
        endChapter: 1125,
        summary: 'The crew arrives at Vegapunk\'s island and uncovers world secrets.',
      ),
      const Arc(
        id: 'elbaf',
        name: 'Elbaf',
        saga: 'Final Saga',
        startChapter: 1126,
        endChapter: 9999,
        summary: 'The Straw Hats finally reach the land of the giants.',
      ),
    ];
  }

  Arc? getById(String id) {
    final all = getArcs();
    try {
      return all.firstWhere((a) => a.id == id);
    } catch (_) {
      return null;
    }
  }
}
