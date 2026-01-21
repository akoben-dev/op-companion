import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:one_piece_companion/features/chapters/application/chapters_providers.dart';
import 'package:one_piece_companion/features/chapters/application/read_status_providers.dart';


class ChapterDetailScreen extends ConsumerWidget {
  const ChapterDetailScreen({
    super.key,
    required this.chapterId,
    this.arcName,
  });

  final String chapterId;
  final String? arcName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chapter = ref.watch(chapterByIdProvider(chapterId));
    final readChapters = ref.watch(readChaptersProvider);
    final isRead = readChapters.contains(chapterId);

    if (chapter == null) {
      return const Scaffold(
        body: Center(
          child: Text('Chapter not found'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter ${chapter.number}'),
        actions: [
          IconButton(
            icon: Icon(isRead ? Icons.check_circle : Icons.radio_button_unchecked),
            tooltip: isRead ? 'Mark as unread' : 'Mark as read',
            onPressed: () {
              ref.read(readChaptersProvider.notifier).toggleRead(chapterId);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (arcName != null) ...[
              Text(
                arcName!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
            ],
            Text(
              'Title: ${chapter.title}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 12),
            Text('Arc ID: ${chapter.arcId}'),
            const SizedBox(height: 24),
            Text(
              isRead ? 'Status: Read' : 'Status: Not read yet',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            const Text(
              'Here you will later show recap, characters, locations, and a '
              '"Read on official app" button.',
            ),
          ],
        ),
      ),
    );
  }
}
