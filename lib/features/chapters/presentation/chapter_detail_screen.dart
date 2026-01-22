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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chapter number and milestone badge
            Row(
              children: [
                Text(
                  'Chapter ${chapter.number}',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                if (chapter.isMilestone) ...[
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'MILESTONE',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 8),

            // Title
            Text(
              chapter.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
            ),
            const SizedBox(height: 16),

            // Arc name
            if (arcName != null) ...[
              _InfoRow(
                icon: Icons.book,
                label: 'Arc',
                value: arcName!,
                context: context,
              ),
              const SizedBox(height: 8),
            ],

            // Release date
            if (chapter.releaseDate != null) ...[
              _InfoRow(
                icon: Icons.calendar_today,
                label: 'Released',
                value: _formatDate(chapter.releaseDate!),
                context: context,
              ),
              const SizedBox(height: 8),
            ],

            // Read status
            _InfoRow(
              icon: isRead ? Icons.check_circle : Icons.radio_button_unchecked,
              label: 'Status',
              value: isRead ? 'Read' : 'Not read yet',
              context: context,
            ),
            const SizedBox(height: 24),

            // Summary section
            if (chapter.summary != null) ...[
              const Divider(),
              const SizedBox(height: 16),
              Text(
                'Summary',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                chapter.summary!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
            ],

            // Placeholder for future features
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'Coming Soon',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Future updates will include:\n'
              '• Character appearances\n'
              '• Key locations\n'
              '• Major events\n'
              '• "Read on official app" link',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
      ];
      return '${months[date.month - 1]} ${date.day}, ${date.year}';
    } catch (_) {
      return dateString;
    }
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.context,
  });

  final IconData icon;
  final String label;
  final String value;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
