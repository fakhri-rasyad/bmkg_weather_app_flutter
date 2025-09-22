import 'package:bmkg_weather_app_flutter/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class MinorWeatherCard extends StatelessWidget {
  const MinorWeatherCard({
    super.key,
    required this.date,
    required this.temp,
    required this.svg,
  });
  final String date;
  final int temp;
  final String svg;

  @override
  Widget build(BuildContext context) {
    final parsed = DateTime.parse(date).toLocal();
    final hour = DateFormat.Hm().format(parsed); // 24h format like 14:00
    return Expanded(
      child: Card(
        child: Padding(
          padding: CustomThemes.smPadding,
          child: Row(
            children: [
              SvgPicture.network(svg, height: 36),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "$temp°C",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(hour, style: Theme.of(context).textTheme.bodyMedium),
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
