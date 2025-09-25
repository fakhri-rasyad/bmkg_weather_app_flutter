import 'package:bmkg_weather_app_flutter/features/onboarding/data/model/wilayah.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/data/source/local_source.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/data/source/remote_source.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/domain/entity/response_entity.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/domain/repository/weather_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  LocalDataSource localDataSource;
  RemoteSource remoteSource;

  WeatherRepositoryImpl(this.localDataSource, this.remoteSource);

  @override
  Future<Either<String, String>> getWilayahCode(String sublocationName) async {
    try {
      final List<Wilayah?> code = await localDataSource.getWilayahCode(
        sublocationName,
      );

      if (code.first == null) {
        return left("Wilayah tidak terdaftar");
      }

      final correctOne = code.firstWhere((e) => e!.nama == sublocationName);

      if (correctOne == null) {
        return left("Wilayah tidak terdaftar");
      }

      return right(correctOne.kode);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, ResponseEntity>> getWilayahCuaca(
    String kodeWilayah,
  ) async {
    try {
      final response = await remoteSource.getWeatherReport(kodeWilayah);
      return response.fold(
        (onError) {
          return left(onError);
        },
        (onSuccess) async {
          final responseEntity = await compute(
            (model) => ResponseEntity.fromModel(model),
            onSuccess,
          );
          return right(responseEntity);
        },
      );
    } catch (e) {
      return left("Error: $e");
    }
  }
}
