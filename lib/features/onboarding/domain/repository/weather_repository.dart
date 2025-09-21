// import 'package:bkmg_weather_app/features/home/data/model/wilayah.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/domain/entity/response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepository {
  Future<Either<String, String>> getWilayahCode(String sublocationName);
  Future<Either<String, ResponseEntity>> getWilayahCuaca(String kodeWilayah);
}
