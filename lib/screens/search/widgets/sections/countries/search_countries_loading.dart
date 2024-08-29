import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../constants.dart';
import '../../../../../theme/theme.dart';
import '../../../../../util/color.dart';

class SearchCountriesLoading extends StatelessWidget {
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
          physics: const BouncingScrollPhysics(),
          itemCount: 12,
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: getRandomBalunColor(context),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  height: 24,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.colors.black.withOpacity(0.25),
                  ),
                ),
              ],
            ),
          ),
          separatorBuilder: (_, __) => const SizedBox(height: 4),
        ),
      );
}