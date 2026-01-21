// lib/core/router/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:one_piece_companion/features/home/presentation/home_screen.dart';
import 'package:one_piece_companion/features/arcs/presentation/arcs_screen.dart';
import 'package:one_piece_companion/features/characters/presentation/characters_screen.dart';
import 'package:one_piece_companion/features/encyclopedia/presentation/encyclopedia_screen.dart';
import 'package:one_piece_companion/features/profile/presentation/profile_screen.dart';

import 'package:one_piece_companion/features/chapters/presentation/chapters_screen.dart';
import 'package:one_piece_companion/features/chapters/presentation/chapter_detail_screen.dart';
import 'package:one_piece_companion/features/characters/presentation/character_detail_screen.dart';
import 'package:one_piece_companion/features/encyclopedia/presentation/devil_fruits_screen.dart';
import 'package:one_piece_companion/features/encyclopedia/presentation/devil_fruit_detail_screen.dart';
import 'package:one_piece_companion/features/encyclopedia/presentation/locations_screen.dart';
import 'package:one_piece_companion/features/encyclopedia/presentation/location_detail_screen.dart';
import 'package:one_piece_companion/features/settings/presentation/settings_screen.dart';


class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _index = 0;

  final _screens = const [
    HomeScreen(),
    ArcsScreen(),
    CharactersScreen(),
    EncyclopediaScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) => setState(() => _index = value),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Arcs'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Chars'),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Lore'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'root',
      builder: (context, state) => const RootShell(),
      routes: [
        GoRoute(
          path: 'settings',
          name: 'settings',
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          path: 'location/:id',
          name: 'locationDetail',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return LocationDetailScreen(locationId: id);
          },
        ),
        GoRoute(
          path: 'fruit/:id',
          name: 'devilFruitDetail',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return DevilFruitDetailScreen(fruitId: id);
          },
        ),
        GoRoute(
          path: 'arc/:id',
          name: 'arcChapters',
          builder: (context, state) {
            final arcId = state.pathParameters['id']!;
            final arcName = state.uri.queryParameters['name'] ?? 'Arc';
            return ChaptersScreen(arcId: arcId, arcName: arcName);
          },
        ),
        GoRoute(
          path: 'chapter/:id',
          name: 'chapterDetail',
          builder: (context, state) {
            final chapterId = state.pathParameters['id']!;
            final extra = state.extra as Map<String, dynamic>?;
            final arcName = extra?['arcName'] as String?;
            return ChapterDetailScreen(
              chapterId: chapterId,
              arcName: arcName,
            );
          },
        ),
        GoRoute(
          path: 'character/:id',
          name: 'characterDetail',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return CharacterDetailScreen(characterId: id);
          },
        ),
      ],
    ),
  ],
);
