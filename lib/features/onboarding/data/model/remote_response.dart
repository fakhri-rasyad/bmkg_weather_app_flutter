import 'package:bmkg_weather_app_flutter/features/onboarding/data/model/cuaca_remote.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/data/model/lokasi_remote.dart';
import 'package:equatable/equatable.dart';

class RemoteResponse extends Equatable {
  final LokasiRemote lokasiRemote;
  final List<List<CuacaRemote>> data;

  const RemoteResponse(this.lokasiRemote, this.data);

  @override
  List<Object?> get props => [lokasiRemote, data];

  factory RemoteResponse.fromJson(Map<String, dynamic> json) {
    return RemoteResponse(
      LokasiRemote.fromJson(json["lokasi"]),
      (json["data"][0]["cuaca"] as List)
          .map(
            (list) =>
                (list as List).map((e) => CuacaRemote.fromJson(e)).toList(),
          )
          .toList(),
    );
  }
}
