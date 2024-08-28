import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:watch_it/watch_it.dart';

import '../../../../../../constants.dart';
import '../../../../../../util/dependencies.dart';
import '../../../../../../util/state.dart';
import '../../../../../../widgets/balun_empty.dart';
import '../../../../../../widgets/balun_error.dart';
import '../../../../controllers/match_standings_controller.dart';
import 'match_standings_content.dart';
import 'match_standings_loading.dart';

class MatchStandingsSection extends WatchingStatefulWidget {
  final int? matchId;
  final int? leagueId;
  final int? season;

  const MatchStandingsSection({
    required this.matchId,
    required this.leagueId,
    required this.season,
  });

  @override
  State<MatchStandingsSection> createState() => _MatchStandingsSectionState();
}

class _MatchStandingsSectionState extends State<MatchStandingsSection> {
  @override
  void initState() {
    super.initState();
    getIt
        .get<MatchStandingsController>(
          instanceName: '${widget.matchId}',
        )
        .getStandings(
          leagueId: widget.leagueId,
          season: widget.season,
        );
  }

  @override
  Widget build(BuildContext context) {
    final standingsState = watchIt<MatchStandingsController>(
      instanceName: '${widget.matchId}',
    ).value;

    return Animate(
      key: ValueKey(standingsState),
      effects: const [
        FadeEffect(
          curve: Curves.easeIn,
          duration: BalunConstants.animationDuration,
        ),
      ],
      child: switch (standingsState) {
        Initial() => const BalunEmpty(
            message: "Initial state, this shouldn't happen",
          ),
        Loading() => MatchStandingsLoading(),
        Empty() => const BalunEmpty(
            message: 'There are no standings',
            verticalPadding: 8,
          ),
        Error() => BalunError(
            error: (standingsState as Error).error ?? 'Generic standings error',
          ),
        Success() => MatchStandingsContent(
            league: (standingsState as Success).data,
          ),
      },
    );
  }
}
