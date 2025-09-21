import 'package:bmkg_weather_app_flutter/features/onboarding/data/model/cuaca_remote.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/data/model/remote_response.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/domain/entity/cuaca_entity.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/domain/entity/lokasi_entity.dart';
import 'package:equatable/equatable.dart';

class ResponseEntity extends Equatable {
  final LokasiEntity lokasiEntity;
  final List<CuacaEntity> cuacaEntity;

  const ResponseEntity(this.lokasiEntity, this.cuacaEntity);

  @override
  List<Object?> get props => [lokasiEntity, cuacaEntity];

  factory ResponseEntity.fromModel(RemoteResponse model) {
    final List<CuacaEntity> cuacaList = [];

    for (List<CuacaRemote> element in model.data) {
      for (CuacaRemote e in element) {
        cuacaList.add(CuacaEntity.fromModel(e));
      }
    }

    return ResponseEntity(
      LokasiEntity.fromModel(model.lokasiRemote),
      cuacaList,
    );
  }
}
