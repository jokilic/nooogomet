import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/fixtures/fixture_response.dart';
import '../../../util/fixtures.dart';
import 'fixtures_list_tile/fixtures_country_list_tile.dart';

class FixturesSuccess extends StatelessWidget {
  final List<FixtureResponse> fixtures;

  const FixturesSuccess({
    required this.fixtures,
  });

  @override
  Widget build(BuildContext context) {
    final sortedGroupedFixtures = sortGroupedFixtures(
      groupFixtures(fixtures),
    );

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      physics: const BouncingScrollPhysics(),
      itemCount: sortedGroupedFixtures.length,
      itemBuilder: (_, countryIndex) {
        final countryLeague = sortedGroupedFixtures.keys.elementAtOrNull(countryIndex);
        final leagues = sortedGroupedFixtures[countryLeague];

        return FixturesCountryListTile(
          countryLeague: countryLeague,
          leagues: leagues,
          initiallyExpanded: BalunConstants.countriesOrder.containsKey(
            countryLeague?.country,
          ),
        );
      },
    );
  }
}
