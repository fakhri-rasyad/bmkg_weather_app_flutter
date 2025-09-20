import 'package:bmkg_weather_app_flutter/utils/themes/themes.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const PrimaryButton(this.onTap, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: CustomThemes.primaryButtonTheme,
      child: Text(text),
    );
  }
}
