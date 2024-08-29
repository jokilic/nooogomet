import 'package:flutter/material.dart';

import '../../../../../models/search/search_teams/search_team_response.dart';
import '../../../../../routing.dart';
import 'search_teams_list_tile.dart';

class SearchTeamsSuccess extends StatelessWidget {
  final List<SearchTeamResponse> teams;

  const SearchTeamsSuccess({
    required this.teams,
  });

  @override
  Widget build(BuildContext context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: teams.length,
        itemBuilder: (_, index) {
          final team = teams[index];

          return SearchTeamsListTile(
            team: team,
            teamPressed: team.team?.id != null
                ? () => openTeam(
                      context,
                      teamId: team.team!.id!,
                      season: DateTime.now().year,
                    )
                : null,
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 4),
      );
}
