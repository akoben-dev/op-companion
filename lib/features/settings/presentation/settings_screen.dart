// lib/features/settings/presentation/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/settings_providers.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  late final TextEditingController _controller;
  bool _loadingInitial = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    // Load initial value from SharedPreferences via the service.
    Future.microtask(() async {
      final url =
          await ref.read(settingsServiceProvider).getPreferredReaderUrl();
      if (mounted) {
        setState(() {
          _controller.text = url ?? '';
          _loadingInitial = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final text = _controller.text.trim();

    // Basic URL validation: if not empty, it must be a valid http(s) URL.
    if (text.isNotEmpty) {
      final uri = Uri.tryParse(text);
      final isValid = uri != null &&
          uri.hasAbsolutePath &&
          (uri.scheme == 'https' || uri.scheme == 'http');

      if (!isValid) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a valid http(s) URL')),
        );
        return;
      }
    }

    await ref.read(settingsServiceProvider).setPreferredReaderUrl(
          text.isEmpty ? null : text,
        );

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Preferred reader URL saved')),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loadingInitial) {
      return Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Preferred reader URL',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Example: https://mangaplus.shueisha.co.jp or your preferred reader site.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'https://example.com',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _save,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
