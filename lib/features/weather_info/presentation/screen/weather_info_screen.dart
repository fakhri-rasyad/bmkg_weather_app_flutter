import 'package:bmkg_weather_app_flutter/features/weather_info/presentation/cubit/info_screen_cubit.dart';
import 'package:bmkg_weather_app_flutter/features/weather_info/presentation/widget/minort_weather_card_row.dart';
import 'package:bmkg_weather_app_flutter/features/weather_info/presentation/widget/weather_card.dart';
import 'package:bmkg_weather_app_flutter/utils/themes/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class WeatherInfoScreen extends StatefulWidget {
  static const routeName = "/weather_info";
  const WeatherInfoScreen({super.key});

  @override
  State<WeatherInfoScreen> createState() => _WeatherInfoScreenState();
}

class _WeatherInfoScreenState extends State<WeatherInfoScreen> {
  late final cubit = context.read<InfoScreenCubit>();

  @override
  void initState() {
    super.initState();
    cubit.getUserCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: CustomThemes.mdPadding,
          child: Column(
            spacing: 8,
            children: [
              Flexible(
                flex: 7,
                child: BlocBuilder<InfoScreenCubit, InfoScreenState>(
                  builder: (context, state) {
                    return WeatherCard();
                  },
                ),
              ),
              Flexible(flex: 1, child: SizedBox(height: 8)),
              MinortWeatherCardRow(),
            ],
          ),
        ),
      ),
    );
  }
}
