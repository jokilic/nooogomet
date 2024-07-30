import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/fixtures/fixtures_response.dart';
import '../models/standings/standings_response.dart';
import '../models/teams/teams_response.dart';
import '../util/isolates.dart';
import 'logger_service.dart';

class APIService extends ValueNotifier<int> {
  final LoggerService logger;
  final Dio dio;

  APIService({
    required this.logger,
    required this.dio,
  }) : super(0);

  void incrementState() => value = value + 1;

  ///
  /// `/fixtures`
  ///

  Future<({FixturesResponse? fixturesResponse, String? error})> getFixtures() async {
    try {
      final response = await dio.get(
        '/fixtures',
        queryParameters: {
          // 'live': 'all',
          'last': 15,
        },
      );

      incrementState();

      /// Handle status codes
      switch (response.statusCode) {
        /// Response is successful
        case 200:
          try {
            final parsedResponse = await computeFixtures(response.data);
            return (fixturesResponse: parsedResponse, error: null);
          } catch (e) {
            final error = 'API -> getFixtures -> parsing error -> $e';
            logger.e(error);
            return (fixturesResponse: null, error: error);
          }

        /// Response is not successful
        default:
          final error = 'API -> getFixtures -> StatusCode ${response.statusCode}';
          logger.e(error);
          return (fixturesResponse: null, error: error);
      }
    } catch (e) {
      final error = 'API -> getFixtures -> catch -> $e';
      logger.e(error);
      return (fixturesResponse: null, error: error);
    }
  }

  Future<({FixturesResponse? fixturesResponse, String? error})> getMatch({
    required int matchId,
  }) async {
    try {
      final response = await dio.get(
        '/fixtures',
        queryParameters: {
          'id': matchId,
        },
      );

      incrementState();

      /// Handle status codes
      switch (response.statusCode) {
        /// Response is successful
        case 200:
          try {
            final parsedResponse = await computeFixtures(response.data);
            return (fixturesResponse: parsedResponse, error: null);
          } catch (e) {
            final error = 'API -> getMatch -> parsing error -> $e';
            logger.e(error);
            return (fixturesResponse: null, error: error);
          }

        /// Response is not successful
        default:
          final error = 'API -> getMatch -> StatusCode ${response.statusCode}';
          logger.e(error);
          return (fixturesResponse: null, error: error);
      }
    } catch (e) {
      final error = 'API -> getMatch -> catch -> $e';
      logger.e(error);
      return (fixturesResponse: null, error: error);
    }
  }

  ///
  /// `/teams`
  ///

  Future<({TeamsResponse? teamsResponse, String? error})> getTeam({
    required int teamId,
  }) async {
    try {
      final response = await dio.get(
        '/teams',
        queryParameters: {
          'id': teamId,
        },
      );

      incrementState();

      /// Handle status codes
      switch (response.statusCode) {
        /// Response is successful
        case 200:
          try {
            final parsedResponse = await computeTeams(response.data);
            return (teamsResponse: parsedResponse, error: null);
          } catch (e) {
            final error = 'API -> getTeam -> parsing error -> $e';
            logger.e(error);
            return (teamsResponse: null, error: error);
          }

        /// Response is not successful
        default:
          final error = 'API -> getTeam -> StatusCode ${response.statusCode}';
          logger.e(error);
          return (teamsResponse: null, error: error);
      }
    } catch (e) {
      final error = 'API -> getTeam -> catch -> $e';
      logger.e(error);
      return (teamsResponse: null, error: error);
    }
  }

  ///
  /// `/standings`
  ///

  Future<({StandingsResponse? standingsResponse, String? error})> getStandings({
    required int leagueId,
    required int season,
  }) async {
    try {
      final response = await dio.get(
        '/standings',
        queryParameters: {
          'league': leagueId,
          'season': season,
        },
      );

      incrementState();

      /// Handle status codes
      switch (response.statusCode) {
        /// Response is successful
        case 200:
          try {
            final parsedResponse = await computeStandings(response.data);
            return (standingsResponse: parsedResponse, error: null);
          } catch (e) {
            final error = 'API -> getStandings -> parsing error -> $e';
            logger.e(error);
            return (standingsResponse: null, error: error);
          }

        /// Response is not successful
        default:
          final error = 'API -> getStandings -> StatusCode ${response.statusCode}';
          logger.e(error);
          return (standingsResponse: null, error: error);
      }
    } catch (e) {
      final error = 'API -> getStandings -> catch -> $e';
      logger.e(error);
      return (standingsResponse: null, error: error);
    }
  }
}
