import 'package:bmkg_weather_app_flutter/core/data_source/local/database_service.dart';
import 'package:bmkg_weather_app_flutter/core/data_source/remote/dio_config.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/data/repository/weather_repository_impl.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/data/source/local_source.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/data/source/remote_source.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/domain/repository/weather_repository.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/domain/usecase/get_wilayah_code_usecase.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/domain/usecase/get_wilayah_cuaca_usecase.dart';
import 'package:bmkg_weather_app_flutter/features/weather_info/presentation/cubit/info_screen_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class DepedencyInjection {
  Future<void> init() async {
    sl.registerSingletonAsync<DatabaseService>(() async {
      final databaseService = DatabaseService();
      await databaseService.init();
      return databaseService;
    });

    sl.registerLazySingleton<Dio>(() => DioConfig().dio);

    sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImplementation(sl<DatabaseService>()),
    );

    sl.registerLazySingleton<RemoteSource>(() => RemoteSourceImpl(sl<Dio>()));

    sl.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(sl<LocalDataSource>(), sl<RemoteSource>()),
    );

    sl.registerLazySingleton<GetWilayahCuacaUsecase>(
      () => GetWilayahCuacaUsecase(sl<WeatherRepository>()),
    );

    sl.registerLazySingleton<GetWilayahCodeUsecase>(
      () => GetWilayahCodeUsecase(sl<WeatherRepository>()),
    );

    sl.registerLazySingleton<InfoScreenCubit>(
      () => InfoScreenCubit(
        sl<GetWilayahCodeUsecase>(),
        sl<GetWilayahCuacaUsecase>(),
      ),
    );
  }
}
