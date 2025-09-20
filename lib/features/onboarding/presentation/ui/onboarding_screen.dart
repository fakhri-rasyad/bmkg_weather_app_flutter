import 'package:bmkg_weather_app_flutter/features/weather_info/presentation/screen/weather_info_screen.dart';
import 'package:bmkg_weather_app_flutter/shared/widgets/primary_button.dart';
import 'package:bmkg_weather_app_flutter/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = "/onboarding";

  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: CustomThemes.mdPadding,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/logo/logo.svg',
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: 32),
                PrimaryButton(
                  () => Navigator.pushReplacementNamed(
                    context,
                    WeatherInfoScreen.routeName,
                  ),
                  "CEK CUACA",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Route<void> _createRoute()
}
