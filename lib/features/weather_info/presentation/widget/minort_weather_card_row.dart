import 'package:bmkg_weather_app_flutter/features/weather_info/presentation/cubit/info_screen_cubit.dart';
import 'package:bmkg_weather_app_flutter/features/weather_info/presentation/widget/minor_weather_card.dart';
import 'package:bmkg_weather_app_flutter/features/weather_info/presentation/widget/minor_weather_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MinortWeatherCardRow extends StatelessWidget {
  const MinortWeatherCardRow({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoScreenCubit, InfoScreenState>(
      builder: (context, state) {
        if (state is InfoScreenCuacaLoaded) {
          final cuacaList = state.response.cuacaEntity;
          return Row(
            children: List.generate(
              3,
              (index) => MinorWeatherCard(
                date: cuacaList[index].datetime,
                temp: cuacaList[index].temp,
                svg: cuacaList[index].image,
              ),
            ),
          );
        }
        return Row(
          children: List.generate(3, (_) => MinorWeatherCardShimmer()),
        );
      },
    );
  }
}
