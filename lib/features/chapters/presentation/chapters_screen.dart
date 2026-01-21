import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:one_piece_companion/features/chapters/application/chapters_providers.dart';
import 'package:one_piece_companion/features/chapters/application/read_status_providers.dart';



class ReadChaptersNotifierTest extends StateNotifier<Set<String>> {
  ReadChaptersNotifierTest() : super(<String>{});
}

class ChaptersScreen extends ConsumerWidget {
  const ChaptersScreen({super.key, required this.arcId, required this.arcName});

  final String arcId;
  final String arcName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chapters = ref.watch(chaptersForArcProvider(arcId));
    // final readChapters = ref.watch(readChaptersProviderTest);

    final readChapters = ref.watch(readChaptersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('$arcName chapters'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: chapters.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final chapter = chapters[index];
          final isRead = readChapters.contains(chapter.id);

          return Card(
            child: ListTile(
              title: Text('Chapter ${chapter.number}'),
              subtitle: Text(chapter.title),
              trailing: Icon(
                isRead ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isRead ? Colors.green : null,
              ),
              onTap: () {
                context.push(
                  '/chapter/${chapter.id}',
                  extra: {'arcName': arcName},
                );
              },
            ),
          );
        },
      ),
    );
  }
}
