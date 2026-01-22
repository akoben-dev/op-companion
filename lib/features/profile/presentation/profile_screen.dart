// lib/features/profile/presentation/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../application/profile_stats_providers.dart';
import 'package:one_piece_companion/features/profile/application/reading_streak_providers.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(profileStatsProvider);
    final streakAsync = ref.watch(readingStreakProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Reading progress',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: stats.progress.clamp(0.0, 1.0)),
          const SizedBox(height: 8),
          Text(
            '${stats.readChapters} of ${stats.totalChapters} chapters read',
            style: theme.textTheme.bodyMedium,
          ),

          const SizedBox(height: 12),

          // Streak info
          streakAsync.when(
            data: (streak) => Text(
              'Streak: ${streak.currentStreakDays} day(s) • '
              'Best: ${streak.bestStreakDays} • '
              'Active last 7 days: ${streak.activeLast7Days}',
              style: theme.textTheme.bodySmall,
            ),
            error: (_, __) => const SizedBox.shrink(),
            loading: () => const SizedBox.shrink(),
          ),
          const SizedBox(height: 24),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            subtitle: const Text('Reader preferences, etc.'),
            onTap: () => context.push('/settings'),
          ),
        ],
      ),
    );
  }
}
