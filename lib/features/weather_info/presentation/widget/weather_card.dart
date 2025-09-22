import 'package:bmkg_weather_app_flutter/features/weather_info/presentation/cubit/info_screen_cubit.dart';
import 'package:bmkg_weather_app_flutter/features/weather_info/presentation/widget/weather_minor_data_row.dart';
import 'package:bmkg_weather_app_flutter/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: CustomThemes.mdPadding,
        child: BlocBuilder<InfoScreenCubit, InfoScreenState>(
          builder: (context, state) {
            if (state is InfoScreenLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is InfoScreenCuacaLoaded) {
              final location = state.response.lokasiEntity;
              final selectedCuaca = state.cuacaData;
              return Column(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LocationData(
                    locationName: location.desa,
                    date: selectedCuaca.datetime,
                  ),
                  FittedBox(
                    child: SvgPicture.network(selectedCuaca.image, width: 200),
                  ),
                  WeatherData(
                    temp: selectedCuaca.temp,
                    weatherDesc: selectedCuaca.weatherDesc,
                  ),
                  WeatherMinorDataRow(
                    huInfo: selectedCuaca.hu,
                    wsInfo: selectedCuaca.windSpeed,
                  ),
                ],
              );
            }
            if (state is InfoScreenError) {
              return Column(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, size: 64),
                  Text(
                    state.message,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              );
            }
            return Column(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo/logo.png"),
                Text(
                  "Cek Cuaca Lokasi",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class WeatherData extends StatelessWidget {
  const WeatherData({super.key, required this.temp, required this.weatherDesc});
  final int temp;
  final String weatherDesc;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$temp°C", style: Theme.of(context).textTheme.displayLarge),
        Text(weatherDesc, style: Theme.of(context).textTheme.displaySmall),
      ],
    );
  }
}

class LocationData extends StatelessWidget {
  const LocationData({
    super.key,
    required this.locationName,
    required this.date,
  });
  final String locationName;
  final String date;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat("MMMd").format(DateTime.parse(date));
    final timeFormat = DateFormat("jm").format(DateTime.parse(date));
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_pin),
            Text(style: Theme.of(context).textTheme.bodyLarge, locationName),
          ],
        ),
        Text(
          "$dateFormat, $timeFormat",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
