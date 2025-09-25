import 'package:bmkg_weather_app_flutter/features/onboarding/data/model/wilayah.dart';
import 'package:equatable/equatable.dart';

class WilayahEntity extends Equatable {
  const WilayahEntity(this.name, this.code);

  final String name;
  final String code;

  @override
  List<Object?> get props => [name, code];

  factory WilayahEntity.fromModel(Wilayah wilayah) {
    return WilayahEntity(wilayah.nama, wilayah.kode);
  }
}
