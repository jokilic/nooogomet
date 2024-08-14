import 'package:flutter/material.dart';

import '../../../../../../models/fixtures/event/event.dart';
import '../../../../../../models/fixtures/score/score.dart';
import '../../../../../../theme/theme.dart';
import 'match_events_list_tile.dart';

class MatchEventsSection extends StatelessWidget {
  final List<Event>? eventsScoresList;
  final Score? score;
  final int? elapsed;
  final int? awayTeamId;

  const MatchEventsSection({
    required this.eventsScoresList,
    required this.score,
    required this.elapsed,
    required this.awayTeamId,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          children: (eventsScoresList?.isNotEmpty ?? false)
              ? [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Text(
                          'Match started',
                          style: context.textStyles.matchEventsSectionResult,
                        ),
                      ],
                    ),
                  ),
                  ...eventsScoresList!
                      .map(
                        (event) => MatchEventsListTile(
                          event: event,
                          elapsed: elapsed,
                          isAwayTeam: event.team?.id == awayTeamId,
                        ),
                      )
                      .toList(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Match finished',
                          style: context.textStyles.matchEventsSectionResult,
                        ),
                        if (score?.fulltime?.home != null && score?.fulltime?.away != null)
                          Text(
                            '${score?.fulltime?.home}:${score?.fulltime?.away}',
                            style: context.textStyles.matchEventsSectionResult,
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ]
              : [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.blueGrey,
                  ),
                ],
        ),
      );
}
