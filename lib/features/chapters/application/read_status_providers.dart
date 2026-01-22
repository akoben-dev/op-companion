// lib/features/chapters/application/read_status_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:one_piece_companion/features/profile/application/reading_streak_providers.dart';

/// Set of chapter IDs the user has marked as read.
final readChaptersProvider =
    StateNotifierProvider<ReadChaptersNotifier, Set<String>>(
  (ref) => ReadChaptersNotifier(ref)..loadFromStorage(),
);

const _readChaptersKey = 'read_chapters_ids';

class ReadChaptersNotifier extends StateNotifier<Set<String>> {
  ReadChaptersNotifier(this.ref) : super(<String>{});

  final Ref ref;

  bool isRead(String chapterId) => state.contains(chapterId);

  Future<void> loadFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_readChaptersKey) ?? <String>[];
    state = list.toSet();
  }

  Future<void> _saveToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_readChaptersKey, state.toList());
  }

  Future<void> toggleRead(String chapterId) async {
    final wasRead = state.contains(chapterId);

    if (wasRead) {
      state = {
        for (final id in state)
          if (id != chapterId) id,
      };
    } else {
      state = {...state, chapterId};

      // Mark today as an active reading day only when newly read
      await ref
          .read(readingStreakServiceProvider)
          .markTodayActive();
    }

    await _saveToStorage();
  }
}
