import 'package:flutter/material.dart';

import '../../../../../../models/sidelined/sidelined_inner_response.dart';
import '../../../../../../widgets/balun_seperator.dart';
import 'player_sidelined_list_tile.dart';

class PlayerSidelinedContent extends StatelessWidget {
  final List<SidelinedInnerResponse>? sidelined;

  const PlayerSidelinedContent({
    required this.sidelined,
  });

  @override
  Widget build(BuildContext context) => ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: sidelined?.length ?? 0,
        itemBuilder: (_, index) => PlayerSidelinedListTile(
          sidelined: sidelined![index],
        ),
        separatorBuilder: (_, __) => const BalunSeperator(),
      );
}