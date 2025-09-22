import 'package:flutter/material.dart';

class MinorWeatherInfo extends StatelessWidget {
  const MinorWeatherInfo({
    super.key,
    required this.icon,
    required this.infoDetail,
  });

  final IconData icon;
  final String infoDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon),
        Text(infoDetail, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
