import 'package:equatable/equatable.dart';

class LokasiRemote extends Equatable {
  final String provinsi;
  final String desa;

  const LokasiRemote(this.provinsi, this.desa);

  @override
  List<Object?> get props => [provinsi, desa];

  factory LokasiRemote.fromJson(Map json) {
    return LokasiRemote(json["provinsi"], json["desa"]);
  }
}
