import 'package:bmkg_weather_app_flutter/shared/widgets/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class WeatherCardShimmer extends StatelessWidget {
  const WeatherCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            spacing: 8,
            children: [
              ShimmerContainer(height: 24, width: 128),
              ShimmerContainer(height: 16, width: 96),
            ],
          ),

          ShimmerContainer(height: 300),
          Column(
            spacing: 8,
            children: [
              ShimmerContainer(height: 24, width: 72),
              ShimmerContainer(height: 16, width: 48),
            ],
          ),
          Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                spacing: 8,
                children: [
                  ShimmerContainer(height: 24, width: 72),
                  ShimmerContainer(height: 12, width: 72),
                ],
              ),
              Column(
                spacing: 8,
                children: [
                  ShimmerContainer(height: 24, width: 72),
                  ShimmerContainer(height: 12, width: 72),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WeatherData extends StatelessWidget {
  const WeatherData({super.key, required this.temp, required this.weatherDesc});
  final int temp;
  final String weatherDesc;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$temp°C", style: Theme.of(context).textTheme.displayLarge),
        Text(weatherDesc, style: Theme.of(context).textTheme.displaySmall),
      ],
    );
  }
}

class LocationData extends StatelessWidget {
  const LocationData({
    super.key,
    required this.locationName,
    required this.date,
  });
  final String locationName;
  final String date;

  @override
  Widget build(BuildContext context) {
    final localTime = DateTime.parse(date).toLocal();
    final dateFormat = DateFormat("MMMd").format(localTime);
    final timeFormat = DateFormat("jm").format(localTime);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_pin),
            Text(style: Theme.of(context).textTheme.bodyLarge, locationName),
          ],
        ),
        Text(
          "$dateFormat, $timeFormat",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
