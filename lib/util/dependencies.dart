import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../services/api_service.dart';
import '../services/balun_navigation_bar_service.dart';
import '../services/balun_screen_service.dart';
import '../services/dio_service.dart';
import '../services/logger_service.dart';

final getIt = GetIt.instance;

void initializeServices() => getIt
  ..registerSingletonAsync(
    () async => LoggerService(),
  )
  ..registerSingletonAsync(
    () async {
      final dio = DioService(
        logger: getIt.get<LoggerService>(),
      );
      await dio.init();
      return dio;
    },
    dependsOn: [LoggerService],
  )
  ..registerSingletonAsync(
    () async => APIService(
      logger: getIt.get<LoggerService>(),
      noCacheDio: getIt.get<DioService>().noCacheDio,
      cacheDio: getIt.get<DioService>().cacheDio,
      internetConnection: InternetConnection(),
    ),
    dependsOn: [LoggerService, DioService],
  )
  ..registerSingletonAsync(
    () async => BalunNavigationBarService(
      logger: getIt.get<LoggerService>(),
    ),
    dependsOn: [LoggerService],
  )
  ..registerSingletonAsync(
    () async => BalunScreenService(
      logger: getIt.get<LoggerService>(),
    ),
    dependsOn: [LoggerService, BalunNavigationBarService],
  );
