import 'package:bmkg_weather_app_flutter/features/onboarding/data/model/cuaca_remote.dart';
import 'package:equatable/equatable.dart';

class CuacaEntity extends Equatable {
  final int temp;
  final String datetime;
  final String weatherDesc;
  final int windSpeed;
  final int hu;
  final String image;

  const CuacaEntity({
    required this.temp,
    required this.datetime,
    required this.weatherDesc,
    required this.windSpeed,
    required this.hu,
    required this.image,
  });

  @override
  List<Object?> get props => [temp, datetime, weatherDesc, image];

  factory CuacaEntity.fromModel(CuacaRemote model) {
    return CuacaEntity(
      temp: model.temp,
      datetime: model.datetime,
      weatherDesc: model.weatherDesc,
      windSpeed: model.windSpeed,
      hu: model.humidity,
      image: model.image,
    );
  }
}
