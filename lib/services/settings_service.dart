// lib/services/settings_service.dart
import 'package:shared_preferences/shared_preferences.dart';

const _preferredReaderUrlKey = 'preferred_reader_url';

class SettingsService {
  const SettingsService();

  Future<String?> getPreferredReaderUrl() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_preferredReaderUrlKey);
  }

  Future<void> setPreferredReaderUrl(String? url) async {
    final prefs = await SharedPreferences.getInstance();
    if (url == null || url.trim().isEmpty) {
      await prefs.remove(_preferredReaderUrlKey);
    } else {
      await prefs.setString(_preferredReaderUrlKey, url.trim());
    }
  }
}
