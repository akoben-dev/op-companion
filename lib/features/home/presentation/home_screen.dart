// lib/features/home/presentation/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:one_piece_companion/features/arcs/application/arcs_providers.dart';
import 'package:one_piece_companion/features/arcs/application/arc_progress_providers.dart';
import 'package:one_piece_companion/features/chapters/application/read_status_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arcs = ref.watch(arcsProvider);
    final arcProgressList = ref.watch(arcProgressListProvider);
    final readChapters = ref.watch(readChaptersProvider);

    // Basic overall stats
    final totalChapters = arcs.fold<int>(
      0,
      (sum, arc) => sum + (arc.endChapter - arc.startChapter + 1),
    );
    final totalRead = readChapters.length.clamp(0, totalChapters);
    final overallFraction =
        totalChapters == 0 ? 0.0 : totalRead / totalChapters;

    // Simple "current chapter" guess: next unread number after max read
    final readNumbers = readChapters
        .map((id) => int.tryParse(id.replaceAll(RegExp(r'[^0-9]'), '')))
        .whereType<int>()
        .toList()
      ..sort();

    final lastReadNumber = readNumbers.isNotEmpty ? readNumbers.last : 0;
    final nextChapterNumber = lastReadNumber + 1;

    return SingleChildScrollView(
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
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: overallFraction.clamp(0.0, 1.0),
                    minHeight: 8,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$totalRead / $totalChapters chapters read',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Continue reading card
          Card(
            child: ListTile(
              leading: const Icon(Icons.play_arrow),
              title: Text(
                readNumbers.isEmpty
                    ? 'Start at Chapter 1'
                    : 'Continue at Chapter $nextChapterNumber',
              ),
              subtitle: Text(
                readNumbers.isEmpty
                    ? 'You have not marked any chapters as read yet.'
                    : 'Last finished: Chapter $lastReadNumber',
              ),
              onTap: () {
                // For now, just navigate to the Arcs tab
                // (You can later jump directly to a specific arc/chapter.)
                final rootNavigator = GoRouter.of(context);
                // Ensure we land on Arcs tab index 1 by telling RootShell if needed.
                // For now, we'll just push the Arcs route path:
                rootNavigator.go('/'); // go home, then user can tap Arcs
              },
            ),
          ),

          const SizedBox(height: 16),

          // Quick arcs overview
          Text(
            'Arc overview',
            style: Theme.of(context).textTheme.titleMedium,
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
            style: Theme.of(context).textTheme.titleMedium,
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
                  // For now, just go to root; user can tap the Arcs tab.
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
