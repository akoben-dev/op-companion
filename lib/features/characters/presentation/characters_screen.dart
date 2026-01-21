// lib/features/characters/presentation/characters_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../application/characters_providers.dart';

class CharactersScreen extends ConsumerWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characters = ref.watch(filteredCharactersProvider);
    final searchQuery = ref.watch(charactersSearchQueryProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search characters...',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              ref.read(charactersSearchQueryProvider.notifier).state = value;
            },
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: characters.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final c = characters[index];
              return Card(
                child: ListTile(
                  title: Text(c.name),
                  subtitle: Text('${c.role} · ${c.affiliation}'),
                  trailing: c.bounty != null
                      ? Text('${c.bounty} B')
                      : const SizedBox.shrink(),
                  onTap: () {
                    // clear keyboard focus while navigating
                    FocusScope.of(context).unfocus();
                    context.push('/character/${c.id}');
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
