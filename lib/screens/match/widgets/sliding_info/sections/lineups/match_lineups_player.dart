import 'package:flutter/material.dart';

import '../../../../../../models/fixtures/lineup/lineup_colors.dart';
import '../../../../../../models/fixtures/lineup/lineup_player.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../../util/color.dart';
import '../../../../../../util/lineups.dart';
import '../../../../../../util/player_kit_painter.dart';
import '../../../../../../util/string.dart';
import '../../../../../../widgets/balun_button.dart';

class MatchLineupsPlayer extends StatelessWidget {
  final LineupPlayer? player;
  final double? fieldHeight;
  final double? fieldWidth;
  final List<int>? formationLayers;
  final int? totalRows;
  final LineupColors? playerColors;

  const MatchLineupsPlayer({
    required this.player,
    required this.fieldHeight,
    required this.fieldWidth,
    required this.formationLayers,
    required this.totalRows,
    required this.playerColors,
  });

  @override
  Widget build(BuildContext context) {
    if (player?.player != null && fieldHeight != null && fieldWidth != null && (formationLayers?.isNotEmpty ?? false) && totalRows != null) {
      final gridParts = player!.player!.grid!.split(':');
      final row = int.parse(gridParts[0]);
      final positionInRow = int.parse(gridParts[1]);

      /// Calculate y position with enhanced spacing
      final rowSpacings = calculateRowSpacings(
        totalRows ?? 0,
      );
      final yPosition = calculateYPosition(
        row,
        rowSpacings,
      );

      /// Calculate x position with enhanced spacing
      final playersInRow = formationLayers![row - 1];
      final xPosition = calculateXPosition(
        positionInRow,
        playersInRow,
      );

      /// Set player sizes & colors
      const playerSize = 48.0;

      final playerPrimaryColor = textToColor(
            player?.player?.pos == 'G' ? playerColors?.goalkeeper?.primary : playerColors?.player?.primary,
          ) ??
          context.colors.white;
      final playerBorderColor = textToColor(
            player?.player?.pos == 'G' ? playerColors?.goalkeeper?.border : playerColors?.player?.border,
          ) ??
          context.colors.white;
      final playerNumberColor = textToColor(
            player?.player?.pos == 'G' ? playerColors?.goalkeeper?.number : playerColors?.player?.number,
          ) ??
          context.colors.black;

      return Positioned(
        left: xPosition * fieldWidth! - playerSize / 2,
        top: yPosition * fieldHeight! - playerSize / 2,
        child: BalunButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomPaint(
                painter: PlayerKitPainter(
                  primaryColor: playerPrimaryColor,
                  borderColor: playerBorderColor,
                  numberColor: playerNumberColor,
                  number: player?.player?.number,
                  context: context,
                ),
                size: const Size(playerSize, playerSize),
              ),
              if (player?.player?.name != null) ...[
                const SizedBox(height: 8),
                SizedBox(
                  width: playerSize,
                  child: Text(
                    getLastWord(player!.player!.name!),
                    style: context.textStyles.matchLineupsSectionPlayer,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
