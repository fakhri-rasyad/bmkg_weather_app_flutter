import 'package:bmkg_weather_app_flutter/features/weather_info/presentation/widget/minort_weather_card_row.dart';
import 'package:bmkg_weather_app_flutter/features/weather_info/presentation/widget/weather_card.dart';
import 'package:bmkg_weather_app_flutter/utils/themes/themes.dart';
import 'package:flutter/material.dart';

class WeatherInfoScreen extends StatelessWidget {
  static const routeName = "/weather_info";
  const WeatherInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: CustomThemes.mdPadding,
          child: Column(
            children: [
              Flexible(flex: 7, child: WeatherCard()),
              Flexible(flex: 1, child: SizedBox(height: 8)),
              MinortWeatherCardRow(),
            ],
          ),
        ),
      ),
    );
  }
}
