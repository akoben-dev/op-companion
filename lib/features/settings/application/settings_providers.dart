// lib/features/settings/application/settings_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_piece_companion/services/settings_service.dart';

final settingsServiceProvider = Provider<SettingsService>((ref) {
  return const SettingsService();
});

/// Cached preferred reader URL as app state.
final preferredReaderUrlProvider =
    FutureProvider<String?>((ref) async {
  final service = ref.watch(settingsServiceProvider);
  return service.getPreferredReaderUrl();
});
