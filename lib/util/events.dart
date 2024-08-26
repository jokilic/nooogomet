import '../models/fixtures/event/event.dart';
import '../models/fixtures/event/event_time.dart';
import '../models/fixtures/score/score.dart';

List<Event>? getEventsList({
  required List<Event>? events,
  required Score? score,
}) {
  if ((events?.isEmpty ?? false) && score == null) {
    return null;
  }

  final eventsScores = List<Event>.from(events ?? []).toList();

  if (score?.halftime?.home != null && score?.halftime?.away != null) {
    eventsScores.add(
      Event(
        type: 'halftime',
        detail: '${score?.halftime?.home}:${score?.halftime?.away}',
        time: EventTime(elapsed: 45),
      ),
    );
  }

  if (score?.fulltime?.home != null && score?.fulltime?.away != null) {
    eventsScores.add(
      Event(
        type: 'fulltime',
        detail: '${score?.fulltime?.home}:${score?.fulltime?.away}',
        time: EventTime(elapsed: 1001),
      ),
    );
  }

  if (score?.extratime?.home != null && score?.extratime?.away != null) {
    eventsScores.add(
      Event(
        type: 'extratime',
        detail: '${score?.extratime?.home}:${score?.extratime?.away}',
        time: EventTime(elapsed: 1002),
      ),
    );
  }

  if (score?.penalty?.home != null && score?.extratime?.away != null) {
    eventsScores.add(
      Event(
        type: 'penalty',
        detail: '${score?.penalty?.home}:${score?.penalty?.away}',
        time: EventTime(elapsed: 1003),
      ),
    );
  }

  eventsScores.sort(
    (a, b) {
      final aTime = (a.time?.elapsed ?? 0) + (a.time?.extra ?? 0);
      final bTime = (b.time?.elapsed ?? 0) + (b.time?.extra ?? 0);

      return aTime.compareTo(bTime);
    },
  );

  return eventsScores;
}

List<Event> calculatedCardsEvents(List<Event>? events) {
  final playerYellowCards = <String, List<Event>>{};
  final processedEvents = <Event>[];

  for (final event in events ?? []) {
    final playerKey = '${event.team?.id}-${event.player?.id}';

    if (event.detail?.toLowerCase() == 'yellow card') {
      playerYellowCards[playerKey] = (playerYellowCards[playerKey] ?? [])..add(event);
      processedEvents.add(event);
    } else if (event.detail?.toLowerCase() == 'red card') {
      /// This is likely a red card due to second yellow, so we skip it
      if (playerYellowCards[playerKey]?.isNotEmpty ?? false) {
        continue;
      }

      /// This is a direct red card, so we keep it
      else {
        processedEvents.add(event);
      }
    }

    /// For all other events, we just add them to the processed list
    else {
      processedEvents.add(event);
    }
  }

  return processedEvents;
}

bool isSecondYellowCard(List<Event> events, Event currentEvent) {
  if (currentEvent.detail?.toLowerCase() != 'yellow card') {
    return false;
  }

  final playerKey = '${currentEvent.team?.id}-${currentEvent.player?.id}';

  final yellowCardCount = events
      .where(
        (event) => '${event.team?.id}-${event.player?.id}' == playerKey && event.detail?.toLowerCase() == 'yellow card' && events.indexOf(event) <= events.indexOf(currentEvent),
      )
      .length;

  return yellowCardCount == 2;
}
