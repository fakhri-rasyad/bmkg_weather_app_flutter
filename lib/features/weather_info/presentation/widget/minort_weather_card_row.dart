import 'package:bmkg_weather_app_flutter/features/weather_info/presentation/widget/minor_weather_card.dart';
import 'package:flutter/material.dart';

class MinortWeatherCardRow extends StatelessWidget {
  const MinortWeatherCardRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [MinorWeatherCard(), MinorWeatherCard(), MinorWeatherCard()],
    );
  }
}
