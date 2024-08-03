import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_styles.dart';

class BalunTheme {
  ///
  /// LIGHT
  ///

  static ThemeData get light {
    final defaultTheme = ThemeData.light();

    return defaultTheme.copyWith(
      scaffoldBackgroundColor: lightAppColors.greenish,
      extensions: [
        lightAppColors,
        lightTextTheme,
      ],
    );
  }

  static final lightAppColors = BalunColorsExtension(
    white: BalunColors.white,
    black: BalunColors.black,
    greenish: BalunColors.greenish,
    red: BalunColors.red,
    green: BalunColors.green,
  );

  static final lightTextTheme = BalunTextThemesExtension(
    fixturesMinute: BalunTextStyles.fixturesMinute.copyWith(
      color: lightAppColors.black.withOpacity(0.5),
    ),
    fixturesName: BalunTextStyles.fixturesName.copyWith(
      color: lightAppColors.black,
    ),
    fixturesScore: BalunTextStyles.fixturesScore.copyWith(
      color: lightAppColors.black,
    ),
    matchLeagueName: BalunTextStyles.matchLeagueName.copyWith(
      color: lightAppColors.black,
    ),
    matchLeagueRound: BalunTextStyles.matchLeagueRound.copyWith(
      color: lightAppColors.black.withOpacity(0.5),
    ),
    matchGoal: BalunTextStyles.matchGoal.copyWith(
      color: lightAppColors.black,
    ),
    matchSectionTitle: BalunTextStyles.matchSectionTitle.copyWith(
      color: lightAppColors.black,
    ),
    matchInfoSectionTitle: BalunTextStyles.matchInfoSectionTitle.copyWith(
      color: lightAppColors.black.withOpacity(0.5),
    ),
    matchInfoSectionText: BalunTextStyles.matchInfoSectionText.copyWith(
      color: lightAppColors.black,
    ),
    matchStandingsSectionTitle: BalunTextStyles.matchStandingsSectionTitle.copyWith(
      color: lightAppColors.black,
    ),
    matchStandingsSectionText: BalunTextStyles.matchStandingsSectionText.copyWith(
      color: lightAppColors.black,
    ),
    matchStandingsSectionTextAlternate: BalunTextStyles.matchStandingsSectionTextAlternate.copyWith(
      color: lightAppColors.black,
    ),
    matchEventsSectionTime: BalunTextStyles.matchEventsSectionTime.copyWith(
      color: lightAppColors.black.withOpacity(0.5),
    ),
    matchEventsSectionText: BalunTextStyles.matchEventsSectionText.copyWith(
      color: lightAppColors.black,
    ),
    matchEventsSectionResult: BalunTextStyles.matchEventsSectionResult.copyWith(
      color: lightAppColors.black,
    ),
    matchLineupsSectionTitle: BalunTextStyles.matchLineupsSectionTitle.copyWith(
      color: lightAppColors.black,
    ),
    matchLineupsSectionText: BalunTextStyles.matchLineupsSectionText.copyWith(
      color: lightAppColors.black,
    ),
    matchLineupsSectionTextSmall: BalunTextStyles.matchLineupsSectionTextSmall.copyWith(
      color: lightAppColors.black.withOpacity(0.5),
    ),
    matchLineupsSectionPlayer: BalunTextStyles.matchLineupsSectionPlayer.copyWith(
      color: lightAppColors.white,
    ),
    matchLineupsSectionNumber: BalunTextStyles.matchLineupsSectionNumber.copyWith(
      color: lightAppColors.white,
    ),
    matchStatisticsSectionText: BalunTextStyles.matchStatisticsSectionText.copyWith(
      color: lightAppColors.black.withOpacity(0.5),
    ),
    matchStatisticsSectionNumber: BalunTextStyles.matchStatisticsSectionNumber.copyWith(
      color: lightAppColors.black,
    ),
    matchPlayerStatisticsName: BalunTextStyles.matchPlayerStatisticsName.copyWith(
      color: lightAppColors.black,
    ),
    matchPlayerStatisticsTitle: BalunTextStyles.matchPlayerStatisticsTitle.copyWith(
      color: lightAppColors.black.withOpacity(0.5),
    ),
    matchPlayerStatisticsText: BalunTextStyles.matchPlayerStatisticsText.copyWith(
      color: lightAppColors.black,
    ),
    matchPlayerStatisticsValue: BalunTextStyles.matchPlayerStatisticsValue.copyWith(
      color: lightAppColors.black,
    ),
    matchH2HScore: BalunTextStyles.matchH2HScore.copyWith(
      color: lightAppColors.black,
    ),
    matchH2HTitle: BalunTextStyles.matchH2HTitle.copyWith(
      color: lightAppColors.black,
    ),
    matchH2HText: BalunTextStyles.matchH2HText.copyWith(
      color: lightAppColors.black.withOpacity(0.5),
    ),
  );
}

extension BalunThemeExtension on ThemeData {
  BalunColorsExtension get balunColors => extension<BalunColorsExtension>() ?? BalunTheme.lightAppColors;
  BalunTextThemesExtension get balunTextStyles => extension<BalunTextThemesExtension>() ?? BalunTheme.lightTextTheme;
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
  BalunColorsExtension get colors => theme.balunColors;
  BalunTextThemesExtension get textStyles => theme.balunTextStyles;
}
