import 'package:bmkg_weather_app_flutter/utils/colors/colors.dart';
import 'package:bmkg_weather_app_flutter/utils/themes/text.dart';
import 'package:flutter/material.dart';

abstract class CustomThemes {
  static ButtonStyle primaryButtonTheme = ElevatedButton.styleFrom(
    iconColor: CustomColors.white,
    textStyle: CustomTextTheme.titleLargeBold,
    backgroundColor: CustomColors.royalBlue,
    overlayColor: CustomColors.jordyBlue,
  );
}
