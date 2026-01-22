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
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search characters...',
              border: const OutlineInputBorder(),
              suffixIcon: (searchQuery.isNotEmpty)
                  ? IconButton(
                      tooltip: 'Clear',
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        ref.read(charactersSearchQueryProvider.notifier).state =
                            '';
                        FocusScope.of(context).unfocus();
                      },
                    )
                  : null,
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
                  key: ValueKey(c.id),
                  leading: SizedBox(
                    width: 40,
                    height: 40,
                    child: _CharacterAvatar(
                      name: c.name,
                      imageUrl: c.imageUrl,
                    ),
                  ),
                  title: Text(
                    c.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    '${c.role} · ${c.affiliation}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: c.bounty != null
                      ? Text(
                          _formatBountyCompact(c.bounty!),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelLarge,
                        )
                      : null,
                  onTap: () {
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

String _formatBountyCompact(int bounty) {
  if (bounty >= 1000000000) {
    final v = bounty / 1000000000;
    return '${v.toStringAsFixed(v.truncateToDouble() == v ? 0 : 1)}B';
  }
  if (bounty >= 1000000) {
    final v = bounty / 1000000;
    return '${v.toStringAsFixed(v.truncateToDouble() == v ? 0 : 1)}M';
  }
  if (bounty >= 1000) {
    final v = bounty / 1000;
    return '${v.toStringAsFixed(v.truncateToDouble() == v ? 0 : 1)}K';
  }
  return bounty.toString();
}

class _CharacterAvatar extends StatelessWidget {
  const _CharacterAvatar({
    required this.name,
    required this.imageUrl,
  });

  final String name;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    final initials = name
        .trim()
        .split(RegExp(r'\s+'))
        .take(2)
        .map((w) => w.isNotEmpty ? w[0].toUpperCase() : '')
        .join();

    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;
    final imageProvider = hasImage ? NetworkImage(imageUrl!) : null;

    return CircleAvatar(
      backgroundColor: color.surfaceContainerHighest,
      foregroundImage: imageProvider,

      // Important: only set this when the image exists (otherwise CircleAvatar asserts). [web:609]
      onForegroundImageError: hasImage ? (_, __) {} : null,

      child: Text(
        initials.isEmpty ? '—' : initials,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: color.onSurfaceVariant,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
