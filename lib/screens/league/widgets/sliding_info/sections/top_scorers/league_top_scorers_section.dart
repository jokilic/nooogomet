import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:watch_it/watch_it.dart';

import '../../../../../../constants.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../../util/dependencies.dart';
import '../../../../../../util/state.dart';
import '../../../../../../widgets/balun_error.dart';
import '../../../../../../widgets/balun_loader.dart';
import '../../../../controllers/league_top_scorers_controller.dart';
import 'league_top_scorers_content.dart';

class LeagueTopScorersSection extends WatchingStatefulWidget {
  final int? leagueId;
  final int? season;

  const LeagueTopScorersSection({
    required this.leagueId,
    required this.season,
  });

  @override
  State<LeagueTopScorersSection> createState() => _LeagueTopScorersSectionState();
}

class _LeagueTopScorersSectionState extends State<LeagueTopScorersSection> {
  @override
  void initState() {
    super.initState();
    getIt
        .get<LeagueTopScorersController>(
          instanceName: '${widget.leagueId}',
        )
        .getTopScorers(
          leagueId: widget.leagueId,
          season: widget.season,
        );
  }

  @override
  Widget build(BuildContext context) {
    final topScorersState = watchIt<LeagueTopScorersController>(
      instanceName: '${widget.leagueId}',
    ).value;

    return Animate(
      key: ValueKey(topScorersState),
      effects: const [
        FadeEffect(
          curve: Curves.easeIn,
          duration: BalunConstants.animationDuration,
        ),
      ],
      // TODO: Implement all states
      child: switch (topScorersState) {
        Initial() => Container(
            color: Colors.green,
            height: 100,
            width: 100,
          ),
        Loading() => Center(
            child: BalunLoader(
              color: context.colors.green,
            ),
          ),
        Empty() => Container(
            color: Colors.grey,
            height: 100,
            width: 100,
          ),
        Error() => BalunError(
            error: (topScorersState as Error).error ?? 'Generic top scorers error',
          ),
        Success() => LeagueTopScorersContent(
            scorers: (topScorersState as Success).data,
          ),
      },
    );
  }
}
