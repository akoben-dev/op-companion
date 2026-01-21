// lib/features/arcs/presentation/arcs_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../application/arcs_providers.dart';
import '../application/arc_progress_providers.dart';

class ArcsScreen extends ConsumerWidget {
  const ArcsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arcs = ref.watch(arcsProvider);
    final progressList = ref.watch(arcProgressListProvider);

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: arcs.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final arc = arcs[index];
        final progress = progressList.firstWhere(
          (p) => p.arc.id == arc.id,
          orElse: () => ArcProgress(
            arc: arc,
            readChapters: 0,
            totalChapters: arc.endChapter - arc.startChapter + 1,
          ),
        );

        final fraction = progress.fraction.clamp(0.0, 1.0);

        return Card(
          child: InkWell(
            onTap: () {
              context.push(
                '/arc/${arc.id}?name=${Uri.encodeComponent(arc.name)}',
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    arc.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${arc.saga} · Ch. ${arc.startChapter}-${arc.endChapter}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: fraction,
                    minHeight: 6,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${progress.readChapters} / ${progress.totalChapters} chapters read',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
