import 'package:bmkg_weather_app_flutter/features/weather_info/presentation/widget/minor_weather_info.dart';
import 'package:flutter/material.dart';

class WeatherMinorDataRow extends StatelessWidget {
  const WeatherMinorDataRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: MinorWeatherInfo()),
        Expanded(child: MinorWeatherInfo()),
      ],
    );
  }
}
