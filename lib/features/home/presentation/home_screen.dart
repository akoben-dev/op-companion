// lib/features/home/presentation/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:one_piece_companion/features/arcs/application/arcs_providers.dart';
import 'package:one_piece_companion/features/arcs/application/arc_progress_providers.dart';
import 'package:one_piece_companion/features/chapters/application/read_status_providers.dart';
import 'package:one_piece_companion/features/home/application/current_reading_provider.dart';
import 'package:one_piece_companion/core/theme/one_piece_colors.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arcs = ref.watch(arcsProvider);
    final arcProgressList = ref.watch(arcProgressListProvider);
    final readChapters = ref.watch(readChaptersProvider);
    final currentReading = ref.watch(currentReadingProvider);
    final theme = Theme.of(context);

    // Basic overall stats
    final totalChapters = arcs.fold<int>(
      0,
      (sum, arc) => sum + (arc.endChapter - arc.startChapter + 1),
    );
    final totalRead = readChapters.length.clamp(0, totalChapters);
    final overallFraction =
        totalChapters == 0 ? 0.0 : totalRead / totalChapters;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/search'),
        child: const Icon(Icons.search),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overall progress card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reading Progress',
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: overallFraction.clamp(0.0, 1.0),
                      minHeight: 8,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$totalRead / $totalChapters chapters read',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Now Reading card with quick actions
            Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Maroon accent stripe
                  Container(
                    height: 4,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      color: OnePieceColors.maroon,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: OnePieceColors.strawGold,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.menu_book,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentReading.hasStarted
                                        ? 'Now Reading'
                                        : 'Start Reading',
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  if (currentReading.arcName != null)
                                    Text(
                                      currentReading.arcName!,
                                      style: theme.textTheme.bodySmall?.copyWith(
                                        color: theme.colorScheme.onSurface
                                            .withOpacity(0.7),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          currentReading.hasStarted
                              ? 'Chapter ${currentReading.nextChapterNumber}'
                              : 'Chapter 1: Romance Dawn',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (currentReading.hasStarted)
                          Text(
                            'Last read: Chapter ${currentReading.lastReadNumber}',
                            style: theme.textTheme.bodySmall,
                          ),
                        const SizedBox(height: 16),
                        // Action buttons
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  context.pushNamed(
                                    'chapterDetail',
                                    pathParameters: {
                                      'id': currentReading.nextChapterId
                                    },
                                  );
                                },
                                child: const Text('Continue'),
                              ),
                            ),
                            const SizedBox(width: 8),
                            if (currentReading.hasStarted)
                              OutlinedButton(
                                onPressed: () async {
                                  await ref
                                      .read(readChaptersProvider.notifier)
                                      .toggleRead(currentReading.nextChapterId);
                                },
                                child: const Text('Mark Read'),
                              ),
                          ],
                        ),
                        if (currentReading.hasStarted) ...[
                          const SizedBox(height: 8),
                          TextButton.icon(
                            icon: const Icon(Icons.undo, size: 16),
                            label: const Text('Undo last read'),
                            onPressed: () async {
                              final lastChapterId =
                                  'ch_${currentReading.lastReadNumber}';
                              await ref
                                  .read(readChaptersProvider.notifier)
                                  .toggleRead(lastChapterId);
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Quick arcs overview
            Text(
              'Arc overview',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Column(
              children: arcProgressList.map((progress) {
                final arc = progress.arc;
                final fraction = progress.fraction.clamp(0.0, 1.0);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Card(
                    child: ListTile(
                      title: Text(arc.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${progress.readChapters} / ${progress.totalChapters} chapters',
                          ),
                          const SizedBox(height: 4),
                          LinearProgressIndicator(
                            value: fraction,
                            minHeight: 4,
                          ),
                        ],
                      ),
                      onTap: () {
                        context.push(
                          '/arc/${arc.id}?name=${Uri.encodeComponent(arc.name)}',
                        );
                      },
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Quick links
            Text(
              'Shortcuts',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _ShortcutChip(
                  icon: Icons.menu_book,
                  label: 'Arcs',
                  onTap: () {
                    GoRouter.of(context).go('/');
                  },
                ),
                _ShortcutChip(
                  icon: Icons.people,
                  label: 'Characters',
                  onTap: () {
                    GoRouter.of(context).go('/');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ShortcutChip extends StatelessWidget {
  const _ShortcutChip({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      onPressed: onTap,
    );
  }
}
