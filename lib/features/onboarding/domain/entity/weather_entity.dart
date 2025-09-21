import 'package:bmkg_weather_app_flutter/features/onboarding/data/model/wilayah.dart';

class WeatherEntity {
  String kode;
  String nama;

  WeatherEntity(this.kode, this.nama);

  factory WeatherEntity.fromModel(Wilayah wilayah) {
    return WeatherEntity(wilayah.kode, wilayah.nama);
  }
}
