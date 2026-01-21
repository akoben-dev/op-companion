// lib/features/encyclopedia/presentation/devil_fruit_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/devil_fruits_providers.dart';

class DevilFruitDetailScreen extends ConsumerWidget {
  const DevilFruitDetailScreen({
    super.key,
    required this.fruitId,
  });

  final String fruitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fruit = ref.watch(devilFruitByIdProvider(fruitId));

    if (fruit == null) {
      return const Scaffold(
        body: Center(child: Text('Devil Fruit not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(fruit.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fruit.type +
                  (fruit.subType != null ? ' · ${fruit.subType}' : ''),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            if (fruit.user != null)
              Text('User: ${fruit.user!}'),
            const SizedBox(height: 8),
            Text('First appearance: ${fruit.firstAppearanceArc}'),
            const SizedBox(height: 16),
            Text(
              fruit.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            const Text(
              'Later you can link this fruit to character and chapter details.',
            ),
          ],
        ),
      ),
    );
  }
}
