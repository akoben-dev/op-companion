// lib/features/arcs/data/arcs_repository.dart
import '../domain/models/arc.dart';

class ArcsRepository {
  const ArcsRepository();

  // temporary hardcoded data
  List<Arc> getArcs() {
    return const [
      Arc(
        id: 'east_blue',
        name: 'East Blue',
        saga: 'East Blue Saga',
        startChapter: 1,
        endChapter: 100,
        summary: 'Luffy sets sail and gathers his first crewmates.',
      ),
      Arc(
        id: 'alabasta',
        name: 'Alabasta',
        saga: 'Alabasta Saga',
        startChapter: 155,
        endChapter: 217,
        summary: 'The crew helps Vivi save her kingdom.',
      ),
    ];
  }
}
