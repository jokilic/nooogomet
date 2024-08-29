import 'package:flutter/material.dart';

import '../../../../../../models/players/player_response.dart';
import '../../../../../../routing.dart';
import '../../../../../../theme/icons.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../../widgets/balun_button.dart';
import '../../../../../../widgets/balun_image.dart';

class LeagueTopRedCardsListTile extends StatelessWidget {
  final PlayerResponse? redCard;
  final int season;

  const LeagueTopRedCardsListTile({
    required this.redCard,
    required this.season,
  });

  @override
  Widget build(BuildContext context) => BalunButton(
        onPressed: redCard?.player?.id != null
            ? () => openPlayer(
                  context,
                  playerId: redCard!.player!.id!,
                  season: season,
                )
            : null,
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: BalunImage(
                  imageUrl: redCard?.player?.photo ?? BalunIcons.placeholderPlayer,
                  height: 56,
                  width: 56,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (redCard?.player?.name != null)
                    Text(
                      redCard!.player!.name!,
                      style: context.textStyles.leagueTeamsTitle,
                    ),
                  if (redCard?.statistics?.isNotEmpty ?? false)
                    Text(
                      '${redCard!.statistics!.fold(0, (sum, statistic) => sum + (statistic.cards?.red ?? 0))} red cards',
                      style: context.textStyles.leagueTeamsCountry,
                    ),
                ],
              ),
            ],
          ),
        ),
      );
}
