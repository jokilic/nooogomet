import 'package:flutter/material.dart';

import '../../../../../../models/players/player_response.dart';
import '../../../../../../widgets/balun_seperator.dart';
import 'league_top_yellow_cards_list_tile.dart';

class LeagueTopYellowCardsContent extends StatelessWidget {
  final List<PlayerResponse>? yellowCards;

  const LeagueTopYellowCardsContent({
    required this.yellowCards,
  });

  @override
  Widget build(BuildContext context) => ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: yellowCards?.length ?? 0,
        itemBuilder: (_, index) => LeagueTopYellowCardsListTile(
          yellowCard: yellowCards![index],
        ),
        separatorBuilder: (_, __) => const BalunSeperator(),
      );
}
