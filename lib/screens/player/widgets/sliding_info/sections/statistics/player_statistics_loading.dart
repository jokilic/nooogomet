import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../../constants.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../../util/color.dart';
import '../../../../../../widgets/balun_seperator.dart';

class PlayerStatisticsLoading extends StatelessWidget {
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
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///
                /// LOGO
                ///
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: getRandomBalunColor(context),
                  ),
                ),
                const SizedBox(width: 12),

                ///
                /// NAME
                ///
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 24,
                        width: 144,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: context.colors.black.withOpacity(0.25),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 16,
                        width: 96,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: context.colors.black.withOpacity(0.15),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          separatorBuilder: (_, __) => const BalunSeperator(),
        ),
      );
}
