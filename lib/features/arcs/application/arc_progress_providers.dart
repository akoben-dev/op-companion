import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/arc.dart';
import 'arcs_providers.dart';
import 'package:one_piece_companion/features/chapters/application/read_status_providers.dart';

/// Progress info for a single arc.
class ArcProgress {
  final Arc arc;
  final int readChapters;
  final int totalChapters;

  const ArcProgress({
    required this.arc,
    required this.readChapters,
    required this.totalChapters,
  });

  double get fraction =>
      totalChapters == 0 ? 0 : readChapters / totalChapters;
}

final arcProgressListProvider = Provider<List<ArcProgress>>((ref) {
  final arcs = ref.watch(arcsProvider);
  final readChapters = ref.watch(readChaptersProvider);

  return arcs.map((arc) {
    final total = arc.endChapter - arc.startChapter + 1;
    // naive count: assume chapter IDs follow pattern like 'ch_1', 'ch_2', etc.
    final readCount = readChapters.where((id) {
      // try to parse numeric part if present
      final numberString = id.replaceAll(RegExp(r'[^0-9]'), '');
      final number = int.tryParse(numberString);
      if (number == null) return false;
      return number >= arc.startChapter && number <= arc.endChapter;
    }).length;

    return ArcProgress(
      arc: arc,
      readChapters: readCount,
      totalChapters: total,
    );
  }).toList();
});
