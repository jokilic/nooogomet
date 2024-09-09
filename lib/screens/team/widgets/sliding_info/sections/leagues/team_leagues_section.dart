import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:watch_it/watch_it.dart';

import '../../../../../../constants.dart';
import '../../../../../../util/dependencies.dart';
import '../../../../../../util/state.dart';
import '../../../../../../widgets/balun_empty.dart';
import '../../../../../../widgets/balun_error.dart';
import '../../../../controllers/team_leagues_controller.dart';
import 'team_leagues_content.dart';
import 'team_leagues_loading.dart';

class TeamLeaguesSection extends WatchingStatefulWidget {
  final int? teamId;

  const TeamLeaguesSection({
    required this.teamId,
  });

  @override
  State<TeamLeaguesSection> createState() => _TeamLeaguesSectionState();
}

class _TeamLeaguesSectionState extends State<TeamLeaguesSection> {
  @override
  void initState() {
    super.initState();
    getIt
        .get<TeamLeaguesController>(
          instanceName: '${widget.teamId}',
        )
        .getLeaguesFromTeam(
          teamId: widget.teamId,
        );
  }

  @override
  Widget build(BuildContext context) {
    final leaguesState = watchIt<TeamLeaguesController>(
      instanceName: '${widget.teamId}',
    ).value;

    return Animate(
      key: ValueKey(leaguesState),
      effects: const [
        FadeEffect(
          curve: Curves.easeIn,
          duration: BalunConstants.animationDuration,
        ),
      ],
      child: switch (leaguesState) {
        Initial() => const BalunError(
            error: "Initial state, this shouldn't happen",
            isSmall: true,
          ),
        Loading() => TeamLeaguesLoading(),
        Empty() => const BalunEmpty(
            message: 'There are no team leagues',
            isSmall: true,
          ),
        Error() => BalunError(
            error: (leaguesState as Error).error ?? 'Generic team leagues error',
            isSmall: true,
          ),
        Success() => TeamLeaguesContent(
            leagues: (leaguesState as Success).data,
          ),
      },
    );
  }
}
