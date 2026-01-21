import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/characters_providers.dart';

class CharacterDetailScreen extends ConsumerWidget {
  const CharacterDetailScreen({
    super.key,
    required this.characterId,
  });

  final String characterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final character = ref.watch(characterByIdProvider(characterId));

    if (character == null) {
      return const Scaffold(
        body: Center(child: Text('Character not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              character.role,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text('Affiliation: ${character.affiliation}'),
            const SizedBox(height: 8),
            if (character.bounty != null)
              Text('Bounty: ${character.bounty} Berries'),
            const SizedBox(height: 8),
            Text('Devil Fruit: ${character.devilFruit ?? 'None'}'),
            const SizedBox(height: 8),
            Text('First Appearance: ${character.firstAppearanceArc}'),
            const SizedBox(height: 24),
            const Text(
              'Later you can add: appearance arcs list, relationships, and links to chapters.',
            ),
          ],
        ),
      ),
    );
  }
}
