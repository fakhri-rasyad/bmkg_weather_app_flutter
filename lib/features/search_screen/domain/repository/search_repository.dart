import 'package:bmkg_weather_app_flutter/features/onboarding/domain/entity/wilayah_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<String, List<WilayahEntity>>> getWilayahList(
    String wilayahName,
  );
}
