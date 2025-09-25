import 'package:bmkg_weather_app_flutter/features/onboarding/data/model/wilayah.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/domain/entity/wilayah_entity.dart';
import 'package:bmkg_weather_app_flutter/features/search_screen/data/source/search_local_source.dart';
import 'package:bmkg_weather_app_flutter/features/search_screen/domain/repository/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl extends SearchRepository {
  SearchRepositoryImpl(this.localDataSource);

  SearchLocalSource localDataSource;

  @override
  Future<Either<String, List<WilayahEntity>>> getWilayahList(
    String wilayahName,
  ) async {
    try {
      final List<Wilayah> code = await localDataSource.getWilayahCode(
        wilayahName,
      );

      if (code.isEmpty) {
        return left("Wilayah tidak terdaftar");
      }

      final wilayahList = code.map((e) => WilayahEntity.fromModel(e)).toList();

      return right(wilayahList);
    } catch (e) {
      return left(e.toString());
    }
  }
}
