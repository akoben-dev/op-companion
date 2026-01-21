// lib/features/profile/application/profile_stats_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_piece_companion/features/chapters/application/chapters_providers.dart';
import 'package:one_piece_companion/features/chapters/application/read_status_providers.dart';

class ProfileStats {
  final int totalChapters;
  final int readChapters;
  final double progress; // 0.0 - 1.0

  ProfileStats({
    required this.totalChapters,
    required this.readChapters,
    required this.progress,
  });
}

final profileStatsProvider = Provider<ProfileStats>((ref) {
  final allChapters = ref.watch(allChaptersProvider); // adjust to your list
  final readChapters = ref.watch(readChaptersProvider);

  final total = allChapters.length;
  final read = readChapters.length;
  final progress = total == 0 ? 0.0 : read / total;

  return ProfileStats(
    totalChapters: total,
    readChapters: read,
    progress: progress,
  );
});
