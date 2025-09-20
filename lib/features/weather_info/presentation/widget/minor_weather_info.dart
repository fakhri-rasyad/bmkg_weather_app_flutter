import 'package:flutter/material.dart';

class MinorWeatherInfo extends StatelessWidget {
  const MinorWeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.wind_power),
        Text("96%", style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
