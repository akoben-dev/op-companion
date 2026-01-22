// lib/features/profile/application/reading_streak_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'reading_streak_service.dart';

final readingStreakServiceProvider =
    Provider<ReadingStreakService>((ref) => const ReadingStreakService());

class ReadingStreakStats {
  final int currentStreakDays;
  final int bestStreakDays;
  final int activeLast7Days;

  ReadingStreakStats({
    required this.currentStreakDays,
    required this.bestStreakDays,
    required this.activeLast7Days,
  });
}

final readingStreakProvider =
    FutureProvider<ReadingStreakStats>((ref) async {
  final service = ref.watch(readingStreakServiceProvider);
  final dates = await service.loadActiveDates();
  if (dates.isEmpty) {
    return ReadingStreakStats(
      currentStreakDays: 0,
      bestStreakDays: 0,
      activeLast7Days: 0,
    );
  }

  // Sort & dedupe
  final sorted = dates.toSet().toList()..sort();

  // Compute streaks
  int current = 1;
  int best = 1;

  for (var i = 1; i < sorted.length; i++) {
    final diff = sorted[i].difference(sorted[i - 1]).inDays;
    if (diff == 1) {
      current++;
      if (current > best) best = current;
    } else if (diff > 1) {
      current = 1;
    }
  }

  // Check if today is part of current streak; if not, current should be 0
  final today = DateTime.now();
  final todayNorm = DateTime(today.year, today.month, today.day);
  final last = sorted.last;
  final lastDiff = todayNorm.difference(last).inDays;
  final currentStreak =
      lastDiff == 0 ? current : 0; // break if last activity not today

  // Activity in last 7 days
  final sevenDaysAgo = todayNorm.subtract(const Duration(days: 6));
  final activeLast7 = sorted
      .where((d) => !d.isBefore(sevenDaysAgo) && !d.isAfter(todayNorm))
      .length;

  return ReadingStreakStats(
    currentStreakDays: currentStreak,
    bestStreakDays: best,
    activeLast7Days: activeLast7,
  );
});
