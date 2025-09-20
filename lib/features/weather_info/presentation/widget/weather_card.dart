import 'package:bmkg_weather_app_flutter/features/weather_info/presentation/widget/weather_minor_data_row.dart';
import 'package:bmkg_weather_app_flutter/utils/themes/themes.dart';
import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: CustomThemes.mdPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LocationData(),
            Icon(Icons.wb_sunny, size: 256),
            WeatherData(),
            WeatherMinorDataRow(),
          ],
        ),
      ),
    );
  }
}

class WeatherData extends StatelessWidget {
  const WeatherData({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("21*C", style: Theme.of(context).textTheme.displayLarge),
        Text(
          "Cuaca Description",
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}

class LocationData extends StatelessWidget {
  const LocationData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_pin),
            Text(style: Theme.of(context).textTheme.bodyLarge, "Location"),
          ],
        ),
        Text("DD MMM, HH:MM", style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
