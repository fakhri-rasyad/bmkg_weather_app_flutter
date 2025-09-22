import 'package:bmkg_weather_app_flutter/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MinorWeatherCardShimmer extends StatelessWidget {
  const MinorWeatherCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: CustomThemes.smPadding,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[400]!,
            highlightColor: Colors.grey[100]!,
            child: Row(
              children: [
                Container(height: 24, width: 24, color: Colors.white),
                Padding(padding: CustomThemes.smPadding),
                Expanded(
                  child: Column(
                    spacing: 8.0,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 16,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                      Container(
                        height: 8,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
