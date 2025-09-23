import 'package:bmkg_weather_app_flutter/shared/widgets/shimmer_container.dart';
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
              spacing: 8.0,
              children: [
                ShimmerContainer(height: 24, width: 24),
                Expanded(
                  child: Column(
                    spacing: 8.0,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ShimmerContainer(height: 16, width: double.infinity),
                      ShimmerContainer(height: 8, width: double.infinity),
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
