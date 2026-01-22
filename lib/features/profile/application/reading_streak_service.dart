// lib/features/profile/application/reading_streak_service.dart
import 'package:shared_preferences/shared_preferences.dart';

const _streakDatesKey = 'reading_streak_dates'; // stores List<String> of dates

class ReadingStreakService {
  const ReadingStreakService();

  Future<void> markTodayActive() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_streakDatesKey) ?? <String>[];

    final today = _dateKey(DateTime.now());
    if (!list.contains(today)) {
      list.add(today);
      await prefs.setStringList(_streakDatesKey, list);
    }
  }

  Future<List<DateTime>> loadActiveDates() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_streakDatesKey) ?? <String>[];
    return list
        .map((s) => DateTime.tryParse(s))
        .whereType<DateTime>()
        .map(_normalize)
        .toList();
  }

  String _dateKey(DateTime dt) => _normalize(dt).toIso8601String();

  DateTime _normalize(DateTime dt) => DateTime(dt.year, dt.month, dt.day);
}
