import 'package:bmkg_weather_app_flutter/features/weather_info/presentation/widget/minor_weather_info.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class WeatherMinorDataRow extends StatelessWidget {
  const WeatherMinorDataRow({
    super.key,
    required this.huInfo,
    required this.wsInfo,
  });
  final int huInfo;
  final double wsInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MinorWeatherInfo(
            icon: Symbols.humidity_percentage,
            infoDetail: "$huInfo%",
          ),
        ),
        Expanded(
          child: MinorWeatherInfo(
            icon: Symbols.air,
            infoDetail: "$wsInfo Km/h",
          ),
        ),
      ],
    );
  }
}
