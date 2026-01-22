// lib/features/search/presentation/search_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../application/search_providers.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final results = ref.watch(searchResultsProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search characters, arcs, fruits...',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            ref.read(searchQueryProvider.notifier).state = value;
          },
        ),
      ),
      body: _controller.text.trim().isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    size: 64,
                    color: theme.colorScheme.onBackground.withOpacity(0.3),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Search the One Piece universe',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onBackground.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            )
          : results.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off,
                        size: 64,
                        color:
                            theme.colorScheme.onBackground.withOpacity(0.3),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No results found',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color:
                              theme.colorScheme.onBackground.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    if (results.characters.isNotEmpty) ...[
                      _SectionHeader(title: 'Characters'),
                      ...results.characters.map(
                        (c) => ListTile(
                          leading: const Icon(Icons.person),
                          title: Text(c.name),
                          subtitle: Text('${c.role} • ${c.affiliation}'),
                          onTap: () {
                            context.push('/character/${c.id}');
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    if (results.arcs.isNotEmpty) ...[
                      _SectionHeader(title: 'Arcs'),
                      ...results.arcs.map(
                        (a) => ListTile(
                          leading: const Icon(Icons.menu_book),
                          title: Text(a.name),
                          subtitle: Text(
                              '${a.saga} • Ch. ${a.startChapter}-${a.endChapter}'),
                          onTap: () {
                            context.push(
                                '/arc/${a.id}?name=${Uri.encodeComponent(a.name)}');
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    if (results.fruits.isNotEmpty) ...[
                      _SectionHeader(title: 'Devil Fruits'),
                      ...results.fruits.map(
                        (f) => ListTile(
                          leading: const Icon(Icons.spa),
                          title: Text(f.name),
                          subtitle: Text(
                              '${f.type}${f.user != null ? ' • ${f.user}' : ''}'),
                          onTap: () {
                            context.push('/fruit/${f.id}');
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    if (results.locations.isNotEmpty) ...[
                      _SectionHeader(title: 'Locations'),
                      ...results.locations.map(
                        (l) => ListTile(
                          leading: const Icon(Icons.place),
                          title: Text(l.name),
                          subtitle: Text(l.sea),
                          onTap: () {
                            context.push('/location/${l.id}');
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    if (results.chapters.isNotEmpty) ...[
                      _SectionHeader(title: 'Chapters'),
                      ...results.chapters.take(10).map(
                            (ch) => ListTile(
                              leading: const Icon(Icons.bookmark),
                              title: Text('Chapter ${ch.number}'),
                              subtitle: Text(ch.title),
                              onTap: () {
                                context.pushNamed(
                                  'chapterDetail',
                                  pathParameters: {'id': ch.id},
                                );
                              },
                            ),
                          ),
                    ],
                  ],
                ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
