import 'package:bmkg_weather_app_flutter/utils/colors/colors.dart';
import 'package:flutter/material.dart';

abstract class CustomTextTheme {
  static const displayLargeBold = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: CustomColors.royalBlue,
  );

  static const displaySmall = TextStyle(
    fontSize: 24,
    color: CustomColors.royalBlue,
  );

  static const titleLargeBold = TextStyle(
    fontSize: 22,
    color: CustomColors.royalBlue,
    fontWeight: FontWeight.bold,
  );

  static const titleMediumBold = TextStyle(
    fontSize: 16,
    color: CustomColors.royalBlue,
    fontWeight: FontWeight.bold,
  );

  static const bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: CustomColors.royalBlue,
  );

  static const bodyMediumReg = TextStyle(
    fontSize: 14,
    color: CustomColors.royalBlue,
  );
}
