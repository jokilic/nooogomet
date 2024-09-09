import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:watch_it/watch_it.dart';

import '../../../../../../constants.dart';
import '../../../../../../util/dependencies.dart';
import '../../../../../../util/state.dart';
import '../../../../../../widgets/balun_empty.dart';
import '../../../../../../widgets/balun_error.dart';
import '../../../../controllers/player_trophies_controller.dart';
import 'player_trophies_content.dart';
import 'player_trophies_loading.dart';

class PlayerTrophiesSection extends WatchingStatefulWidget {
  final int? playerId;

  const PlayerTrophiesSection({
    required this.playerId,
  });

  @override
  State<PlayerTrophiesSection> createState() => _PlayerTrophiesSectionState();
}

class _PlayerTrophiesSectionState extends State<PlayerTrophiesSection> {
  @override
  void initState() {
    super.initState();
    getIt
        .get<PlayerTrophiesController>(
          instanceName: '${widget.playerId}',
        )
        .getPlayerTrophies(
          playerId: widget.playerId,
        );
  }

  @override
  Widget build(BuildContext context) {
    final trophiesState = watchIt<PlayerTrophiesController>(
      instanceName: '${widget.playerId}',
    ).value;

    return Animate(
      key: ValueKey(trophiesState),
      effects: const [
        FadeEffect(
          curve: Curves.easeIn,
          duration: BalunConstants.animationDuration,
        ),
      ],
      child: switch (trophiesState) {
        Initial() => const BalunError(
            error: "Initial state, this shouldn't happen",
            isSmall: true,
          ),
        Loading() => PlayerTrophiesLoading(),
        Empty() => const BalunEmpty(
            message: 'There are no player trophies',
            isSmall: true,
          ),
        Error() => BalunError(
            error: (trophiesState as Error).error ?? 'Generic player trophies error',
            isSmall: true,
          ),
        Success() => PlayerTrophiesContent(
            trophies: (trophiesState as Success).data,
          ),
      },
    );
  }
}
