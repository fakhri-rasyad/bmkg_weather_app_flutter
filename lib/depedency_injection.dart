import 'package:bmkg_weather_app_flutter/core/data_source/local/database_service.dart';
import 'package:bmkg_weather_app_flutter/core/data_source/remote/dio_config.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/data/repository/weather_repository_impl.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/data/source/local_source.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/data/source/remote_source.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/domain/repository/weather_repository.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/domain/usecase/get_wilayah_code_usecase.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/domain/usecase/get_wilayah_cuaca_usecase.dart';
import 'package:bmkg_weather_app_flutter/features/search_screen/data/repository/search_repository_impl.dart';
import 'package:bmkg_weather_app_flutter/features/search_screen/data/source/search_local_source.dart';
import 'package:bmkg_weather_app_flutter/features/search_screen/domain/repository/search_repository.dart';
import 'package:bmkg_weather_app_flutter/features/search_screen/domain/usecase/search_location_usecase.dart';
import 'package:bmkg_weather_app_flutter/features/search_screen/presentation/cubit/search_delegate_cubit.dart';
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
    sl.registerLazySingleton<SearchLocalSource>(
      () => SearchLocalSourceImplementation(sl<DatabaseService>()),
    );

    sl.registerLazySingleton<RemoteSource>(() => RemoteSourceImpl(sl<Dio>()));

    sl.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(sl<LocalDataSource>(), sl<RemoteSource>()),
    );
    sl.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(sl<SearchLocalSource>()),
    );

    sl.registerLazySingleton<GetWilayahCuacaUsecase>(
      () => GetWilayahCuacaUsecase(sl<WeatherRepository>()),
    );
    sl.registerLazySingleton<GetWilayahCodeUsecase>(
      () => GetWilayahCodeUsecase(sl<WeatherRepository>()),
    );

    sl.registerLazySingleton<SearchLocationUsecase>(
      () => SearchLocationUsecase(sl<SearchRepository>()),
    );

    sl.registerLazySingleton<InfoScreenCubit>(
      () => InfoScreenCubit(
        sl<GetWilayahCodeUsecase>(),
        sl<GetWilayahCuacaUsecase>(),
      ),
    );

    sl.registerLazySingleton<SearchDelegateCubit>(
      () => SearchDelegateCubit(sl<SearchLocationUsecase>()),
    );
  }
}
