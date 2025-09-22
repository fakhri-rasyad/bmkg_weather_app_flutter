import 'package:equatable/equatable.dart';

class CuacaRemote extends Equatable {
  final int temp;
  final String datetime;
  final String weatherDesc;
  final double windSpeed;
  final int humidity;
  final String image;

  const CuacaRemote({
    required this.temp,
    required this.datetime,
    required this.weatherDesc,
    required this.windSpeed,
    required this.humidity,
    required this.image,
  });

  @override
  List<Object?> get props => [temp, datetime, weatherDesc, image];

  factory CuacaRemote.fromJson(Map json) {
    return CuacaRemote(
      temp: json["t"],
      datetime: json["datetime"],
      weatherDesc: json["weather_desc"],
      windSpeed: json["ws"],
      humidity: json["hu"],
      image: json["image"],
    );
  }
}
