import 'package:bmkg_weather_app_flutter/utils/colors/colors.dart';
import 'package:bmkg_weather_app_flutter/utils/themes/text.dart';
import 'package:flutter/material.dart';

abstract class CustomThemes {
  static ButtonStyle primaryButtonTheme = ElevatedButton.styleFrom(
    padding: mdPadding,
    iconColor: CustomColors.white,
    textStyle: CustomTextTheme.titleLargeBold,
    backgroundColor: CustomColors.royalBlue,
    overlayColor: CustomColors.jordyBlue,
    foregroundColor: CustomColors.white,
    surfaceTintColor: CustomColors.jordyBlue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(8.0),
    ),
  );

  static const mdPadding = EdgeInsets.all(16);
  static const smPadding = EdgeInsets.all(8.0);
}
