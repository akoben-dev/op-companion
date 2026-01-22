// lib/features/arcs/presentation/arc_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../application/arcs_providers.dart';
import '../../chapters/application/chapters_providers.dart';
import '../../chapters/application/read_status_providers.dart';



class ArcDetailScreen extends ConsumerWidget {
  const ArcDetailScreen({
    super.key,
    required this.arcId,
  });

  final String arcId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arc = ref.watch(arcByIdProvider(arcId));
    final chapters = ref.watch(chaptersByArcProvider(arcId));

    if (arc == null) {
      return const Scaffold(
        body: Center(child: Text('Arc not found')),
      );
    }

    final chapterCount = arc.endChapter - arc.startChapter + 1;
    final chapterRange = arc.endChapter == 9999
        ? 'Ch. ${arc.startChapter}+'
        : 'Ch. ${arc.startChapter}–${arc.endChapter}';

    return Scaffold(
      appBar: AppBar(
        title: Text(arc.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _NetworkHeaderImage(
              imageUrl: arc.imageUrl,
              fallbackText: arc.name,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    arc.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    arc.saga,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 16),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _TagChip(icon: Icons.auto_stories, label: chapterRange),
                      _TagChip(
                        icon: Icons.numbers,
                        label: '$chapterCount chapters',
                      ),
                      _TagChip(icon: Icons.bookmark, label: arc.saga),
                    ],
                  ),

                  const SizedBox(height: 20),
                  _InfoRow(
                    icon: Icons.play_arrow,
                    label: 'Start',
                    value: 'Chapter ${arc.startChapter}',
                  ),
                  const SizedBox(height: 8),
                  _InfoRow(
                    icon: arc.endChapter == 9999 ? Icons.lock_open : Icons.stop,
                    label: 'End',
                    value: arc.endChapter == 9999
                        ? 'Ongoing'
                        : 'Chapter ${arc.endChapter}',
                  ),

                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),
                  Text(
                    'Summary',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    arc.summary,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),
                  
                  // Chapters Section
                  Row(
                    children: [
                      Text(
                        'Chapters',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${chapters.length}',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  
                  // Chapter List
                  ...chapters.map((chapter) {
                    final isRead = ref.watch(isChapterReadProvider(chapter.id));
                    
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: isRead
                              ? Theme.of(context).colorScheme.primaryContainer
                              : Theme.of(context).colorScheme.surfaceContainerHighest,
                          child: Icon(
                            isRead ? Icons.check : Icons.book_outlined,
                            size: 20,
                            color: isRead
                                ? Theme.of(context).colorScheme.onPrimaryContainer
                                : Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                        title: Text(
                          'Chapter ${chapter.number}',
                          style: TextStyle(
                            fontWeight: isRead ? FontWeight.normal : FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          chapter.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          context.push(
                            '/chapter/${chapter.id}',
                            extra: {'arcName': arc.name},
                          );
                        },
                      ),
                    );
                  }).toList(),

                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),
                  Text(
                    'Coming Soon',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Future updates will include:\n'
                    '• Key characters introduced in this arc\n'
                    '• Major events timeline\n'
                    '• Related locations\n'
                    '• Devil Fruits introduced',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.6),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NetworkHeaderImage extends StatelessWidget {
  const _NetworkHeaderImage({
    required this.imageUrl,
    required this.fallbackText,
  });

  final String? imageUrl;
  final String fallbackText;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: color.surfaceContainerHighest,
        child: (imageUrl == null || imageUrl!.isEmpty)
            ? _NeutralFallback(fallbackText: fallbackText)
            : Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(color: color.primary),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return _NeutralFallback(fallbackText: fallbackText);
                },
              ),
      ),
    );
  }
}

class _NeutralFallback extends StatelessWidget {
  const _NeutralFallback({required this.fallbackText});

  final String fallbackText;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final initials = fallbackText
        .trim()
        .split(RegExp(r'\s+'))
        .take(2)
        .map((w) => w.isNotEmpty ? w[0].toUpperCase() : '')
        .join();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.menu_book, size: 56, color: color.onSurfaceVariant),
          const SizedBox(height: 8),
          Text(
            initials.isEmpty ? '—' : initials,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: color.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 6),
          Text(
            'Image unavailable',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: color.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: color.primary),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Chip(
      avatar: Icon(icon, size: 18, color: color.primary),
      label: Text(label),
      backgroundColor: color.surfaceContainerHighest,
    );
  }
}
