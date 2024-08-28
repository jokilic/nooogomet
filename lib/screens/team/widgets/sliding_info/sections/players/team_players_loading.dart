import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../../constants.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../../util/color.dart';
import '../../../../../../widgets/balun_seperator.dart';

class TeamPlayersLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Animate(
        onPlay: (controller) => controller.loop(
          reverse: true,
          min: 0.6,
        ),
        effects: const [
          FadeEffect(
            curve: Curves.easeIn,
            duration: BalunConstants.shimmerDuration,
          ),
        ],
        child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 8,
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: getRandomBalunColor(context),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 24,
                  width: 144,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.colors.black.withOpacity(0.25),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.colors.black.withOpacity(0.25),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  alignment: Alignment.center,
                  height: 44,
                  width: 44,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: context.colors.black.withOpacity(0.15),
                    border: Border.all(
                      color: context.colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
          separatorBuilder: (_, __) => const BalunSeperator(),
        ),
      );
}
