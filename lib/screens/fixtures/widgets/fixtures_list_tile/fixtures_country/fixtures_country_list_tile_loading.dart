import 'package:flutter/material.dart';

import '../../../../../theme/theme.dart';
import '../../../../../util/color.dart';
import '../../../../../util/random.dart';

class FixturesCountryListTileLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: context.colors.white.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: getRandomBalunColor(context),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              height: 24,
              width: getRandomNumberFromBase(200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: context.colors.black.withValues(alpha: 0.25),
              ),
            ),
          ],
        ),
      );
}
