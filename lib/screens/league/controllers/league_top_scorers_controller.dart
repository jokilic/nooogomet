import 'package:flutter/material.dart';

import '../../../models/players/player_response.dart';
import '../../../models/teams/team_response.dart';
import '../../../services/api_service.dart';
import '../../../services/logger_service.dart';
import '../../../util/state.dart';

class LeagueTopScorersController extends ValueNotifier<BalunState<List<PlayerResponse>>> {
  final LoggerService logger;
  final APIService api;

  LeagueTopScorersController({
    required this.logger,
    required this.api,
  }) : super(Initial());

  ///
  /// VARIABLES
  ///

  int? fetchedSeason;

  ///
  /// METHODS
  ///

  Future<void> getTopScorers({
    required int? leagueId,
    required int? season,
  }) async {
    if (leagueId == null || season == null) {
      value = Error(
        error: 'Passed leagueId or season is null',
      );
    }

    if (fetchedSeason == season) {
      return;
    }

    value = Loading();

    final response = await api.getTopScorers(
      leagueId: leagueId!,
      season: season!,
    );

    /// Successful request
    if (response.playersResponse != null && response.error == null) {
      /// Errors exist, update to error state
      if (response.playersResponse!.errors?.isNotEmpty ?? false) {
        value = Error(
          error: response.playersResponse!.errors!.toString(),
        );
      }

      /// Response is not null, update to success state
      else if (response.playersResponse!.response?.isNotEmpty ?? false) {
        fetchedSeason = season;
        value = Success(
          data: response.playersResponse!.response!,
        );
      }

      /// Response is null, update to empty state
      else {
        fetchedSeason = season;
        value = Empty();
      }
    }

    /// Failed request
    if (response.playersResponse == null && response.error != null) {
      /// Error is not null, update to error state
      value = Error(
        error: response.error,
      );
    }
  }
}
