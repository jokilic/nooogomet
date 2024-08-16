import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:watch_it/watch_it.dart';

import '../../constants.dart';
import '../../services/api_service.dart';
import '../../services/logger_service.dart';
import '../../util/dependencies.dart';
import 'controllers/team_coaches_controller.dart';
import 'controllers/team_controller.dart';
import 'controllers/team_leagues_controller.dart';
import 'controllers/team_players_controller.dart';
import 'controllers/team_section_controller.dart';
import 'controllers/team_standings_controller.dart';
import 'widgets/team_content.dart';

class TeamScreen extends WatchingStatefulWidget {
  final int teamId;
  final int season;

  const TeamScreen({
    required this.teamId,
    required this.season,
    required super.key,
  });

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  void initState() {
    super.initState();

    getIt
      ..registerLazySingleton(
        () => TeamSectionController(
          logger: getIt.get<LoggerService>(),
        ),
        instanceName: '${widget.teamId}',
      )
      ..registerLazySingleton(
        () => TeamLeaguesController(
          logger: getIt.get<LoggerService>(),
          api: getIt.get<APIService>(),
        ),
        instanceName: '${widget.teamId}',
      )
      ..registerLazySingleton(
        () => TeamStandingsController(
          logger: getIt.get<LoggerService>(),
          api: getIt.get<APIService>(),
        ),
        instanceName: '${widget.teamId}',
      )
      ..registerLazySingleton(
        () => TeamCoachesController(
          logger: getIt.get<LoggerService>(),
          api: getIt.get<APIService>(),
        ),
        instanceName: '${widget.teamId}',
      )
      ..registerLazySingleton(
        () => TeamPlayersController(
          logger: getIt.get<LoggerService>(),
          api: getIt.get<APIService>(),
        ),
        instanceName: '${widget.teamId}',
      )
      ..registerLazySingleton(
        () => TeamController(
          logger: getIt.get<LoggerService>(),
          api: getIt.get<APIService>(),
        ),
        instanceName: '${widget.teamId}',
      );

    getIt
        .get<TeamController>(
          instanceName: '${widget.teamId}',
        )
        .getTeam(
          teamId: widget.teamId,
        );
  }

  @override
  void dispose() {
    getIt
      ..unregister<TeamSectionController>(
        instanceName: '${widget.teamId}',
      )
      ..unregister<TeamLeaguesController>(
        instanceName: '${widget.teamId}',
      )
      ..unregister<TeamStandingsController>(
        instanceName: '${widget.teamId}',
      )
      ..unregister<TeamCoachesController>(
        instanceName: '${widget.teamId}',
      )
      ..unregister<TeamPlayersController>(
        instanceName: '${widget.teamId}',
      )
      ..unregister<TeamController>(
        instanceName: '${widget.teamId}',
      );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final teamState = watchIt<TeamController>(
      instanceName: '${widget.teamId}',
    ).value;

    return Scaffold(
      body: SafeArea(
        child: Animate(
          key: ValueKey(teamState),
          effects: const [
            FadeEffect(
              curve: Curves.easeIn,
              duration: BalunConstants.animationDuration,
            ),
          ],
          child: TeamContent(
            teamState: teamState,
            season: widget.season,
          ),
        ),
      ),
    );
  }
}
