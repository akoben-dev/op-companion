// lib/features/chapters/data/chapters_repository.dart
import '../domain/models/chapter.dart';

class ChaptersRepository {
  const ChaptersRepository();

  // Single source of truth for all chapters (temporary hardcoded data)
  static const List<Chapter> _all = [
    // Romance Dawn Arc
    Chapter(
      id: 'ch_1',
      number: 1,
      title: 'Romance Dawn',
      arcId: 'romance_dawn',
      releaseDate: '1997-07-22',
      isMilestone: true,
      summary: 'Luffy begins his journey to become Pirate King.',
    ),
    Chapter(
      id: 'ch_2',
      number: 2,
      title: 'That Guy, "Straw Hat Luffy"',
      arcId: 'romance_dawn',
      releaseDate: '1997-07-29',
      isMilestone: false,
      summary: 'Luffy and Koby meet and head to find Zoro.',
    ),
    Chapter(
      id: 'ch_6',
      number: 6,
      title: 'The First One',
      arcId: 'romance_dawn',
      releaseDate: '1997-08-26',
      isMilestone: true,
      summary: 'Zoro officially joins Luffy as his first crewmate.',
    ),

    // Orange Town Arc
    Chapter(
      id: 'ch_8',
      number: 8,
      title: 'Nami',
      arcId: 'orange_town',
      releaseDate: '1997-09-09',
      isMilestone: false,
      summary: 'Nami is introduced stealing a treasure map.',
    ),
    Chapter(
      id: 'ch_21',
      number: 21,
      title: 'The Town',
      arcId: 'orange_town',
      releaseDate: '1997-12-24',
      isMilestone: false,
      summary: 'Buggy is defeated and the crew moves on.',
    ),

    // Syrup Village Arc
    Chapter(
      id: 'ch_22',
      number: 22,
      title: 'The Great Liar',
      arcId: 'syrup_village',
      releaseDate: '1998-01-07',
      isMilestone: false,
      summary: 'Usopp is introduced telling tall tales.',
    ),
    Chapter(
      id: 'ch_41',
      number: 41,
      title: 'The Legend Has Begun',
      arcId: 'syrup_village',
      releaseDate: '1998-05-27',
      isMilestone: false,
      summary: 'Usopp joins and the crew receives the Going Merry.',
    ),

    // Baratie Arc
    Chapter(
      id: 'ch_42',
      number: 42,
      title: 'Pirate Don Krieg',
      arcId: 'baratie',
      releaseDate: '1998-06-03',
      isMilestone: false,
      summary: 'The crew arrives at the floating restaurant Baratie.',
    ),
    Chapter(
      id: 'ch_50',
      number: 50,
      title: 'Pledge',
      arcId: 'baratie',
      releaseDate: '1998-07-29',
      isMilestone: true,
      summary: 'Zoro challenges Mihawk and vows never to lose again.',
    ),
    Chapter(
      id: 'ch_68',
      number: 68,
      title: 'The Fourth One',
      arcId: 'baratie',
      releaseDate: '1998-11-25',
      isMilestone: true,
      summary: 'Sanji joins the crew as the cook.',
    ),

    // Arlong Park Arc
    Chapter(
      id: 'ch_69',
      number: 69,
      title: 'Arlong Park',
      arcId: 'arlong_park',
      releaseDate: '1998-12-02',
      isMilestone: false,
      summary: 'The crew heads to Arlong Park to confront the Fish-Men.',
    ),
    Chapter(
      id: 'ch_81',
      number: 81,
      title: 'Tears',
      arcId: 'arlong_park',
      releaseDate: '1999-02-24',
      isMilestone: true,
      summary: 'Nami asks Luffy for help.',
    ),
    Chapter(
      id: 'ch_94',
      number: 94,
      title: 'The Second',
      arcId: 'arlong_park',
      releaseDate: '1999-07-19',
      isMilestone: true,
      summary: 'Luffy defeats Arlong and declares Nami is his friend.',
    ),
    Chapter(
      id: 'ch_95',
      number: 95,
      title: 'Spinning Windmill',
      arcId: 'arlong_park',
      releaseDate: '1999-07-26',
      isMilestone: true,
      summary: 'Nami officially joins the crew; Luffy receives his first bounty.',
    ),

    // Loguetown Arc
    Chapter(
      id: 'ch_96',
      number: 96,
      title: 'Adventure in Loguetown',
      arcId: 'loguetown',
      releaseDate: '1999-08-02',
      isMilestone: true,
      summary: 'The crew prepares to enter the Grand Line.',
    ),
    Chapter(
      id: 'ch_100',
      number: 100,
      title: 'The Legend Has Begun',
      arcId: 'loguetown',
      releaseDate: '1999-08-30',
      isMilestone: true,
      summary: 'Dragon saves Luffy; the crew enters the Grand Line.',
    ),

    // Reverse Mountain / Whiskey Peak
    Chapter(
      id: 'ch_101',
      number: 101,
      title: 'Reverse Mountain',
      arcId: 'reverse_mountain',
      releaseDate: '1999-09-06',
      isMilestone: true,
      summary: 'The Straw Hats enter the Grand Line via Reverse Mountain.',
    ),
    Chapter(
      id: 'ch_103',
      number: 103,
      title: 'I Promise',
      arcId: 'reverse_mountain',
      releaseDate: '1999-09-20',
      isMilestone: false,
      summary: 'Luffy promises Laboon they will meet again.',
    ),
    Chapter(
      id: 'ch_106',
      number: 106,
      title: 'All-Out Battle',
      arcId: 'reverse_mountain',
      releaseDate: '1999-10-11',
      isMilestone: false,
      summary: 'Baroque Works is revealed at Whiskey Peak.',
    ),

    // Little Garden
    Chapter(
      id: 'ch_115',
      number: 115,
      title: 'Adventure in a Prehistoric Land',
      arcId: 'little_garden',
      releaseDate: '1999-12-13',
      isMilestone: false,
      summary: 'The crew lands on Little Garden.',
    ),
    Chapter(
      id: 'ch_129',
      number: 129,
      title: 'I Will Surpass You',
      arcId: 'little_garden',
      releaseDate: '2000-03-13',
      isMilestone: false,
      summary: 'The giants help the crew escape.',
    ),

    // Drum Island
    Chapter(
      id: 'ch_130',
      number: 130,
      title: 'Sail On',
      arcId: 'drum_island',
      releaseDate: '2000-03-20',
      isMilestone: false,
      summary: 'The crew sails toward Drum Island.',
    ),
    Chapter(
      id: 'ch_134',
      number: 134,
      title: 'Dr. Kureha',
      arcId: 'drum_island',
      releaseDate: '2000-04-17',
      isMilestone: false,
      summary: 'Luffy meets Dr. Kureha and learns about Chopper.',
    ),
    Chapter(
      id: 'ch_149',
      number: 149,
      title: 'Rumble',
      arcId: 'drum_island',
      releaseDate: '2000-07-03',
      isMilestone: false,
      summary: 'Chopper uses Rumble Ball for the first time.',
    ),
    Chapter(
      id: 'ch_154',
      number: 154,
      title: 'This Dust Cloud Called Alabasta',
      arcId: 'drum_island',
      releaseDate: '2000-07-10',
      isMilestone: true,
      summary: 'Chopper joins the crew; Ace appears.',
    ),

    // Alabasta Arc
    Chapter(
      id: 'ch_155',
      number: 155,
      title: 'Off to Alabasta!',
      arcId: 'alabasta',
      releaseDate: '2000-07-17',
      isMilestone: true,
      summary: 'The crew arrives in Alabasta to stop the war.',
    ),
    Chapter(
      id: 'ch_156',
      number: 156,
      title: 'The Adventure in the Kingdom of Sand!',
      arcId: 'alabasta',
      releaseDate: '2000-07-24',
      isMilestone: false,
      summary: 'The crew begins their journey through the desert.',
    ),
    Chapter(
      id: 'ch_196',
      number: 196,
      title: 'Mr. 0',
      arcId: 'alabasta',
      releaseDate: '2001-05-28',
      isMilestone: false,
      summary: 'Crocodile\'s identity as Mr. 0 is revealed.',
    ),
    Chapter(
      id: 'ch_213',
      number: 213,
      title: 'The King of the Desert vs. The King of the Pirates',
      arcId: 'alabasta',
      releaseDate: '2001-09-24',
      isMilestone: true,
      summary: 'Luffy defeats Crocodile.',
    ),
    Chapter(
      id: 'ch_217',
      number: 217,
      title: 'The Summit',
      arcId: 'alabasta',
      releaseDate: '2001-10-22',
      isMilestone: true,
      summary: 'The Alabasta arc concludes; Robin joins the crew.',
    ),

    // Jaya Arc
    Chapter(
      id: 'ch_218',
      number: 218,
      title: 'The Legendary Family',
      arcId: 'jaya',
      releaseDate: '2001-10-29',
      isMilestone: false,
      summary: 'The crew learns about Sky Island.',
    ),
    Chapter(
      id: 'ch_234',
      number: 234,
      title: 'Take Me to the Sky',
      arcId: 'jaya',
      releaseDate: '2002-02-18',
      isMilestone: false,
      summary: 'The crew prepares to reach Skypiea.',
    ),

    // Skypiea Arc
    Chapter(
      id: 'ch_237',
      number: 237,
      title: 'The Great Adventure of the Land of Sand',
      arcId: 'skypiea',
      releaseDate: '2002-03-11',
      isMilestone: true,
      summary: 'The crew begins their journey to the sky.',
    ),
    Chapter(
      id: 'ch_253',
      number: 253,
      title: 'Varse',
      arcId: 'skypiea',
      releaseDate: '2002-06-24',
      isMilestone: false,
      summary: 'The crew explores Upper Yard.',
    ),
    Chapter(
      id: 'ch_300',
      number: 300,
      title: 'Pirate Luffy vs. God Enel',
      arcId: 'skypiea',
      releaseDate: '2003-08-04',
      isMilestone: true,
      summary: 'Luffy battles Enel in an epic showdown.',
    ),
    Chapter(
      id: 'ch_302',
      number: 302,
      title: 'Finale',
      arcId: 'skypiea',
      releaseDate: '2003-08-18',
      isMilestone: true,
      summary: 'Enel is defeated; the Golden Bell rings.',
    ),

    // Long Ring Long Land
    Chapter(
      id: 'ch_303',
      number: 303,
      title: 'The Straw Hat Pirates Return',
      arcId: 'long_ring_long_land',
      releaseDate: '2003-08-25',
      isMilestone: false,
      summary: 'The crew leaves Skypiea.',
    ),
    Chapter(
      id: 'ch_321',
      number: 321,
      title: 'Aokiji vs. Nico Robin',
      arcId: 'long_ring_long_land',
      releaseDate: '2004-01-05',
      isMilestone: true,
      summary: 'Admiral Aokiji confronts the crew.',
    ),

    // Water 7 Arc
    Chapter(
      id: 'ch_322',
      number: 322,
      title: 'Pirate Zoro vs. Naval Officer Luffy',
      arcId: 'water_seven',
      releaseDate: '2004-01-19',
      isMilestone: true,
      summary: 'The crew arrives at Water 7.',
    ),
    Chapter(
      id: 'ch_331',
      number: 331,
      title: 'The Diagnosis',
      arcId: 'water_seven',
      releaseDate: '2004-03-15',
      isMilestone: false,
      summary: 'The Going Merry is declared beyond repair.',
    ),
    Chapter(
      id: 'ch_374',
      number: 374,
      title: 'Jump Towards the Waterfall!!',
      arcId: 'water_seven',
      releaseDate: '2005-02-28',
      isMilestone: false,
      summary: 'The crew heads to Enies Lobby.',
    ),

    // Enies Lobby Arc
    Chapter(
      id: 'ch_375',
      number: 375,
      title: 'Unprecedented',
      arcId: 'enies_lobby',
      releaseDate: '2005-03-07',
      isMilestone: true,
      summary: 'The crew storms Enies Lobby to rescue Robin.',
    ),
    Chapter(
      id: 'ch_398',
      number: 398,
      title: 'Declaration of War',
      arcId: 'enies_lobby',
      releaseDate: '2005-08-22',
      isMilestone: true,
      summary: 'Luffy declares war on the World Government.',
    ),
    Chapter(
      id: 'ch_430',
      number: 430,
      title: 'The Light Snow of Reminiscence Falls on the Lake',
      arcId: 'enies_lobby',
      releaseDate: '2006-05-22',
      isMilestone: true,
      summary: 'Robin is rescued; Going Merry funeral.',
    ),

    // Post-Enies Lobby
    Chapter(
      id: 'ch_435',
      number: 435,
      title: 'The New Bounties',
      arcId: 'post_enies_lobby',
      releaseDate: '2006-06-26',
      isMilestone: false,
      summary: 'The crew receives updated bounties after Enies Lobby.',
    ),
    Chapter(
      id: 'ch_440',
      number: 440,
      title: 'Fire Fist vs. Blackbeard',
      arcId: 'post_enies_lobby',
      releaseDate: '2006-07-31',
      isMilestone: true,
      summary: 'Ace confronts Blackbeard.',
    ),

    // Thriller Bark Arc
    Chapter(
      id: 'ch_442',
      number: 442,
      title: 'The Adventure in the Demonic Sea',
      arcId: 'thriller_bark',
      releaseDate: '2006-08-14',
      isMilestone: true,
      summary: 'The crew enters the Florian Triangle.',
    ),
    Chapter(
      id: 'ch_459',
      number: 459,
      title: 'Oars vs. Straw Hat Pirates',
      arcId: 'thriller_bark',
      releaseDate: '2006-12-11',
      isMilestone: false,
      summary: 'The crew battles the giant zombie Oars.',
    ),
    Chapter(
      id: 'ch_489',
      number: 489,
      title: 'Kuma\'s Bible',
      arcId: 'thriller_bark',
      releaseDate: '2007-10-01',
      isMilestone: true,
      summary: 'Zoro takes Luffy\'s pain; "Nothing happened."',
    ),

    // Sabaody Archipelago
    Chapter(
      id: 'ch_490',
      number: 490,
      title: 'The Eleven Supernovas',
      arcId: 'sabaody',
      releaseDate: '2007-10-15',
      isMilestone: true,
      summary: 'The Worst Generation is introduced.',
    ),
    Chapter(
      id: 'ch_500',
      number: 500,
      title: 'The Straw Hat Crew vs. 100,000 Opponents',
      arcId: 'sabaody',
      releaseDate: '2008-03-17',
      isMilestone: true,
      summary: 'Luffy punches a Celestial Dragon.',
    ),
    Chapter(
      id: 'ch_513',
      number: 513,
      title: 'Here, Right Now',
      arcId: 'sabaody',
      releaseDate: '2008-06-30',
      isMilestone: true,
      summary: 'The crew is scattered by Kuma.',
    ),

    // Amazon Lily
    Chapter(
      id: 'ch_514',
      number: 514,
      title: 'Body and Soul',
      arcId: 'amazon_lily',
      releaseDate: '2008-07-14',
      isMilestone: true,
      summary: 'Luffy lands on Amazon Lily.',
    ),
    Chapter(
      id: 'ch_524',
      number: 524,
      title: 'An Underwater Paradise',
      arcId: 'amazon_lily',
      releaseDate: '2008-10-06',
      isMilestone: false,
      summary: 'Hancock agrees to help Luffy reach Impel Down.',
    ),

    // Impel Down
    Chapter(
      id: 'ch_525',
      number: 525,
      title: 'Hell',
      arcId: 'impel_down',
      releaseDate: '2008-10-20',
      isMilestone: true,
      summary: 'Luffy infiltrates the underwater prison.',
    ),
    Chapter(
      id: 'ch_549',
      number: 549,
      title: 'Straw Hat and Blackbeard',
      arcId: 'impel_down',
      releaseDate: '2009-05-25',
      isMilestone: true,
      summary: 'Luffy escapes Impel Down; Blackbeard appears.',
    ),

    // Marineford Arc
    Chapter(
      id: 'ch_550',
      number: 550,
      title: 'The Navy Headquarters',
      arcId: 'marineford',
      releaseDate: '2009-06-08',
      isMilestone: true,
      summary: 'The Marineford War begins.',
    ),
    Chapter(
      id: 'ch_574',
      number: 574,
      title: 'The Execution Stand',
      arcId: 'marineford',
      releaseDate: '2009-12-28',
      isMilestone: true,
      summary: 'Ace is fatally wounded protecting Luffy.',
    ),
    Chapter(
      id: 'ch_580',
      number: 580,
      title: 'The Power to End It',
      arcId: 'marineford',
      releaseDate: '2010-02-22',
      isMilestone: true,
      summary: 'Shanks ends the Marineford War.',
    ),

    // Post-War
    Chapter(
      id: 'ch_597',
      number: 597,
      title: '3D2Y',
      arcId: 'post_war',
      releaseDate: '2010-08-09',
      isMilestone: true,
      summary: 'Luffy sends his message to the crew; two-year timeskip begins.',
    ),

    // Return to Sabaody
    Chapter(
      id: 'ch_598',
      number: 598,
      title: '2 Years Later',
      arcId: 'return_to_sabaody',
      releaseDate: '2010-08-30',
      isMilestone: true,
      summary: 'The crew begins to reunite after the timeskip.',
    ),
    Chapter(
      id: 'ch_601',
      number: 601,
      title: 'Romance Dawn for the New World',
      arcId: 'return_to_sabaody',
      releaseDate: '2010-09-27',
      isMilestone: false,
      summary: 'The crew sets sail again.',
    ),

    // Fishman Island
    Chapter(
      id: 'ch_603',
      number: 603,
      title: 'Keep That in Mind',
      arcId: 'fishman_island',
      releaseDate: '2010-10-11',
      isMilestone: true,
      summary: 'The crew reunites at Sabaody and heads underwater.',
    ),
    Chapter(
      id: 'ch_600',
      number: 600,
      title: 'Dream Ship',
      arcId: 'fishman_island',
      releaseDate: '2010-09-20',
      isMilestone: false,
      summary: 'The crew descends to Fishman Island.',
    ),
    Chapter(
      id: 'ch_653',
      number: 653,
      title: 'A Hero\'s Hat',
      arcId: 'fishman_island',
      releaseDate: '2011-12-12',
      isMilestone: false,
      summary: 'The Fishman Island arc concludes.',
    ),

    // Punk Hazard
    Chapter(
      id: 'ch_654',
      number: 654,
      title: 'GAM',
      arcId: 'punk_hazard',
      releaseDate: '2011-12-19',
      isMilestone: true,
      summary: 'The crew lands on Punk Hazard.',
    ),
    Chapter(
      id: 'ch_699',
      number: 699,
      title: 'Morning Edition',
      arcId: 'punk_hazard',
      releaseDate: '2013-03-04',
      isMilestone: false,
      summary: 'The Punk Hazard arc concludes; alliance with Law formed.',
    ),

    // Dressrosa
    Chapter(
      id: 'ch_700',
      number: 700,
      title: 'His Pace',
      arcId: 'dressrosa',
      releaseDate: '2013-03-11',
      isMilestone: true,
      summary: 'The Dressrosa arc begins.',
    ),
    Chapter(
      id: 'ch_784',
      number: 784,
      title: 'Gear Fourth',
      arcId: 'dressrosa',
      releaseDate: '2015-04-13',
      isMilestone: true,
      summary: 'Luffy reveals Gear Fourth against Doflamingo.',
    ),
    Chapter(
      id: 'ch_800',
      number: 800,
      title: 'In the Name of the Family',
      arcId: 'dressrosa',
      releaseDate: '2015-09-14',
      isMilestone: true,
      summary: 'Doflamingo is defeated.',
    ),
    Chapter(
      id: 'ch_801',
      number: 801,
      title: 'Opening Declaration',
      arcId: 'dressrosa',
      releaseDate: '2015-09-21',
      isMilestone: true,
      summary: 'The Straw Hat Grand Fleet is formed.',
    ),

    // Zou
    Chapter(
      id: 'ch_802',
      number: 802,
      title: 'Zou',
      arcId: 'zou',
      releaseDate: '2015-10-05',
      isMilestone: true,
      summary: 'The crew heads to Zou.',
    ),
    Chapter(
      id: 'ch_824',
      number: 824,
      title: 'Big Mom of the Four Emperors',
      arcId: 'zou',
      releaseDate: '2016-05-23',
      isMilestone: false,
      summary: 'The Zou arc concludes.',
    ),

    // Whole Cake Island
    Chapter(
      id: 'ch_825',
      number: 825,
      title: 'The Comic Strip',
      arcId: 'whole_cake_island',
      releaseDate: '2016-05-30',
      isMilestone: true,
      summary: 'The Whole Cake Island arc begins.',
    ),
    Chapter(
      id: 'ch_896',
      number: 896,
      title: 'The Last Request',
      arcId: 'whole_cake_island',
      releaseDate: '2018-04-09',
      isMilestone: true,
      summary: 'Luffy escapes Whole Cake Island.',
    ),
    Chapter(
      id: 'ch_900',
      number: 900,
      title: 'Bad End Musical',
      arcId: 'whole_cake_island',
      releaseDate: '2018-04-23',
      isMilestone: true,
      summary: 'Katakuri is defeated; the escape concludes.',
    ),

    // Levely
    Chapter(
      id: 'ch_903',
      number: 903,
      title: 'The Fifth Emperor',
      arcId: 'levely',
      releaseDate: '2018-05-14',
      isMilestone: false,
      summary: 'Luffy is declared the Fifth Emperor.',
    ),
    Chapter(
      id: 'ch_908',
      number: 908,
      title: 'The Reverie Begins',
      arcId: 'levely',
      releaseDate: '2018-06-25',
      isMilestone: false,
      summary: 'World leaders gather at the Reverie.',
    ),

    // Wano Country
    Chapter(
      id: 'ch_909',
      number: 909,
      title: 'Seppuku',
      arcId: 'wano',
      releaseDate: '2018-07-09',
      isMilestone: true,
      summary: 'The Wano arc begins.',
    ),
    Chapter(
      id: 'ch_1000',
      number: 1000,
      title: 'Straw Hat Luffy',
      arcId: 'wano',
      releaseDate: '2021-01-04',
      isMilestone: true,
      summary: 'Luffy faces Kaido on the rooftop.',
    ),
    Chapter(
      id: 'ch_1010',
      number: 1010,
      title: 'Color of the Supreme King',
      arcId: 'wano',
      releaseDate: '2021-03-28',
      isMilestone: true,
      summary: 'Conqueror\'s Haki coating is revealed.',
    ),
    Chapter(
      id: 'ch_1044',
      number: 1044,
      title: 'Liberation Warrior',
      arcId: 'wano',
      releaseDate: '2022-03-28',
      isMilestone: true,
      summary: 'Luffy awakens Gear Fifth and reveals Nika.',
    ),
    Chapter(
      id: 'ch_1057',
      number: 1057,
      title: 'Curtain Call',
      arcId: 'wano',
      releaseDate: '2022-09-05',
      isMilestone: true,
      summary: 'The Wano arc concludes.',
    ),

    // Egghead
    Chapter(
      id: 'ch_1058',
      number: 1058,
      title: 'New Emperors',
      arcId: 'egghead',
      releaseDate: '2022-09-12',
      isMilestone: true,
      summary: 'Luffy, Law, and Kid are declared new Emperors.',
    ),
    Chapter(
      id: 'ch_1089',
      number: 1089,
      title: 'Hostage Situation',
      arcId: 'egghead',
      releaseDate: '2023-06-26',
      isMilestone: true,
      summary: 'Major events unfold at Egghead.',
    ),
    Chapter(
      id: 'ch_1114',
      number: 1114,
      title: 'The Wings of Icarus',
      arcId: 'egghead',
      releaseDate: '2024-05-13',
      isMilestone: true,
      summary: 'Vegapunk\'s broadcast reveals world secrets.',
    ),
    Chapter(
      id: 'ch_1125',
      number: 1125,
      title: 'What Constitutes Death',
      arcId: 'egghead',
      releaseDate: '2024-08-26',
      isMilestone: true,
      summary: 'The Egghead arc concludes.',
    ),

    // Elbaf
    Chapter(
      id: 'ch_1126',
      number: 1126,
      title: 'Resolving to Bear Fangs',
      arcId: 'elbaf',
      releaseDate: '2024-09-23',
      isMilestone: true,
      summary: 'The crew arrives at Elbaf.',
    ),
    Chapter(
      id: 'ch_1135',
      number: 1135,
      title: 'Elsewhere',
      arcId: 'elbaf',
      releaseDate: '2025-01-20',
      isMilestone: false,
      summary: 'The Elbaf arc continues with new mysteries.',
    ),
  ];

  List<Chapter> getAllChapters() {
    // Return a copy so callers can't accidentally mutate the static list
    return List<Chapter>.from(_all);
  }

  List<Chapter> getChaptersForArc(String arcId) {
    return _all.where((c) => c.arcId == arcId).toList();
  }

  Chapter? getChapterById(String id) {
    try {
      return _all.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }
}
