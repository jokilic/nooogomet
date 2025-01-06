import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constants.dart';
import '../util/env.dart';
import 'logger_service.dart';

///
/// Service which holds an instance of `Dio`
/// Used for networking
/// Contains methods that ease our networking logic
///

class DioService {
  ///
  /// CONSTRUCTOR
  ///

  final LoggerService logger;

  DioService({
    required this.logger,
  });

  ///
  /// VARIABLES
  ///

  late final footballDio = Dio(
    BaseOptions(
      baseUrl: kIsWeb ? BalunConstants.balunWebProxy : BalunConstants.apiFootballBaseUrl,
      headers: {
        'x-apisports-key': Env.apiFootballApiKey,
        'Content-Type': 'application/json',
      },
      validateStatus: (_) => true,
    ),
  )..interceptors.add(
      DioLoggerInterceptor(
        logger: logger,
      ),
    );

  late final remoteSettingsDio = Dio(
    BaseOptions(
      baseUrl: BalunConstants.remoteSettingsBaseUrl,
      validateStatus: (_) => true,
    ),
  )..interceptors.add(
      DioLoggerInterceptor(
        logger: logger,
      ),
    );

  late final youTubeSearchDio = Dio(
    BaseOptions(
      baseUrl: BalunConstants.apiYouTubeDataBaseUrl,
      validateStatus: (_) => true,
    ),
  )..interceptors.add(
      DioLoggerInterceptor(
        logger: logger,
      ),
    );
}
