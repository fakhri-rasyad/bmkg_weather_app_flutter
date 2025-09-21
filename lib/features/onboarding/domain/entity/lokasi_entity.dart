import 'package:bmkg_weather_app_flutter/features/onboarding/data/model/lokasi_remote.dart';
import 'package:equatable/equatable.dart';

class LokasiEntity extends Equatable {
  final String provinsi;
  final String desa;

  const LokasiEntity(this.provinsi, this.desa);

  @override
  List<Object?> get props => [provinsi, desa];

  factory LokasiEntity.fromModel(LokasiRemote model) {
    return LokasiEntity(model.provinsi, model.desa);
  }
}
