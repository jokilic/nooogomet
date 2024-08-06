import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:watch_it/watch_it.dart';

import '../../../../constants.dart';
import '../../../../models/leagues/league_response.dart';
import '../../../../theme/theme.dart';
import '../../../../util/dependencies.dart';
import '../../controllers/league_section_controller.dart';
import 'league_active_section.dart';
import 'league_section_titles.dart';

class LeagueSlidingInfo extends WatchingWidget {
  final LeagueResponse league;
  final ScrollController scrollController;

  const LeagueSlidingInfo({
    required this.league,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final leagueSection = watchIt<LeagueSectionController>(
      instanceName: '${league.league?.id}',
    ).value;

    return ListView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      children: [
        ///
        /// BLACK LINE
        ///
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 176,
            vertical: 8,
          ),
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: context.colors.black.withOpacity(0.5),
          ),
        ),

        const SizedBox(height: 8),

        ///
        /// SECTIONS
        ///
        LeagueSectionTitles(
          activeLeagueSection: leagueSection,
          titlePressed: getIt
              .get<LeagueSectionController>(
                instanceName: '${league.league?.id}',
              )
              .updateState,
        ),

        const SizedBox(height: 24),

        ///
        /// ACTIVE SECTION
        ///
        Animate(
          key: ValueKey(leagueSection),
          effects: const [
            FadeEffect(
              curve: Curves.easeIn,
              duration: BalunConstants.animationDuration,
            ),
          ],
          child: LeagueActiveSection(
            league: league,
            leagueSection: leagueSection,
          ),
        ),
      ],
    );
  }
}
