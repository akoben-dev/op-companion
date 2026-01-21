// lib/features/encyclopedia/presentation/encyclopedia_screen.dart
import 'package:flutter/material.dart';

import 'devil_fruits_screen.dart';
import 'locations_screen.dart';

class EncyclopediaScreen extends StatelessWidget {
  const EncyclopediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Devil Fruits + Locations
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Encyclopedia'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Devil Fruits'),
              Tab(text: 'Locations'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DevilFruitsScreen(),
            LocationsScreen(),
          ],
        ),
      ),
    );
  }
}
