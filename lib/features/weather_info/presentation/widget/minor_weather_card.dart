import 'package:bmkg_weather_app_flutter/utils/themes/themes.dart';
import 'package:flutter/material.dart';

class MinorWeatherCard extends StatelessWidget {
  const MinorWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: CustomThemes.smPadding,
          child: Row(
            children: [
              Icon(Icons.sunny, size: 36),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "21*C",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "10:00",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
