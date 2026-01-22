// lib/features/home/application/current_reading_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_piece_companion/features/chapters/application/chapters_providers.dart';
import 'package:one_piece_companion/features/chapters/application/read_status_providers.dart';
import 'package:one_piece_companion/features/arcs/application/arcs_providers.dart';

class CurrentReading {
  final int nextChapterNumber;
  final String nextChapterId;
  final String? arcName;
  final int lastReadNumber;
  final bool hasStarted;

  CurrentReading({
    required this.nextChapterNumber,
    required this.nextChapterId,
    required this.arcName,
    required this.lastReadNumber,
    required this.hasStarted,
  });
}

final currentReadingProvider = Provider<CurrentReading>((ref) {
  final readChapters = ref.watch(readChaptersProvider);
  final allChapters = ref.watch(allChaptersProvider);
  final arcs = ref.watch(arcsProvider);

  // Derive last read and next chapter numbers
  final readNumbers = readChapters
      .map((id) => int.tryParse(id.replaceAll(RegExp(r'[^0-9]'), '')))
      .whereType<int>()
      .toList()
    ..sort();

  final lastReadNumber = readNumbers.isNotEmpty ? readNumbers.last : 0;
  final nextChapterNumber = lastReadNumber + 1;
  final nextChapterId = 'ch_$nextChapterNumber';

  // Find the arc for the next chapter
  final nextChapter = allChapters.firstWhere(
    (ch) => ch.number == nextChapterNumber,
    orElse: () => allChapters.first,
  );
  final arc = arcs.firstWhere(
    (a) => a.id == nextChapter.arcId,
    orElse: () => arcs.first,
  );

  return CurrentReading(
    nextChapterNumber: nextChapterNumber,
    nextChapterId: nextChapterId,
    arcName: arc.name,
    lastReadNumber: lastReadNumber,
    hasStarted: readNumbers.isNotEmpty,
  );
});
