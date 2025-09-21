import 'package:bmkg_weather_app_flutter/core/domain/usecase.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/domain/repository/weather_repository.dart';
import 'package:dartz/dartz.dart';

class GetWilayahCodeUsecase
    extends Usecase<Future<Either<String, String>>, String> {
  final WeatherRepository repository;
  GetWilayahCodeUsecase(this.repository);
  @override
  Future<Either<String, String>> call(String param) {
    return repository.getWilayahCode(param);
  }
}
