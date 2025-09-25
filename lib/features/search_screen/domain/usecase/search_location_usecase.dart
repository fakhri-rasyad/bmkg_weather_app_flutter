import 'package:bmkg_weather_app_flutter/core/domain/usecase.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/domain/entity/wilayah_entity.dart';
import 'package:bmkg_weather_app_flutter/features/search_screen/domain/repository/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchLocationUsecase
    extends Usecase<Future<Either<String, List<WilayahEntity>>>, String> {
  final SearchRepository repo;

  SearchLocationUsecase(this.repo);

  @override
  Future<Either<String, List<WilayahEntity>>> call(String locationName) {
    return repo.getWilayahList(locationName);
  }
}
