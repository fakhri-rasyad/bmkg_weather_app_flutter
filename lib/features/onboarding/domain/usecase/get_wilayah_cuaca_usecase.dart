import 'package:bmkg_weather_app_flutter/core/domain/usecase.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/domain/entity/response_entity.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/domain/repository/weather_repository.dart';
import 'package:dartz/dartz.dart';

class GetWilayahCuacaUsecase
    extends Usecase<Future<Either<String, ResponseEntity>>, String> {
  final WeatherRepository repository;

  GetWilayahCuacaUsecase(this.repository);

  @override
  Future<Either<String, ResponseEntity>> call(String param) {
    return repository.getWilayahCuaca(param);
  }
}
