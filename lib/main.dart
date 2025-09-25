import 'package:bmkg_weather_app_flutter/depedency_injection.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/presentation/ui/onboarding_screen.dart';
import 'package:bmkg_weather_app_flutter/features/search_screen/presentation/cubit/search_delegate_cubit.dart';
import 'package:bmkg_weather_app_flutter/features/weather_info/presentation/cubit/info_screen_cubit.dart';
import 'package:bmkg_weather_app_flutter/features/weather_info/presentation/screen/weather_info_screen.dart';
import 'package:bmkg_weather_app_flutter/utils/colors/colors.dart';
import 'package:bmkg_weather_app_flutter/utils/themes/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DepedencyInjection().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InfoScreenCubit>(
          create: (context) => sl<InfoScreenCubit>(),
        ),
        BlocProvider<SearchDelegateCubit>(
          create: (context) => sl<SearchDelegateCubit>(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          iconTheme: IconThemeData(color: CustomColors.royalBlue, size: 36),
          textTheme: TextTheme(
            displayLarge: CustomTextTheme.displayLargeBold,
            displaySmall: CustomTextTheme.displaySmall,
            titleLarge: CustomTextTheme.titleLargeBold,
            titleMedium: CustomTextTheme.titleMediumBold,
            bodyLarge: CustomTextTheme.bodyLarge,
            bodyMedium: CustomTextTheme.bodyMediumReg,
          ),
        ),
        initialRoute: OnboardingScreen.routeName,
        routes: {
          OnboardingScreen.routeName: (context) => OnboardingScreen(),
          WeatherInfoScreen.routeName: (context) => WeatherInfoScreen(),
        },
      ),
    );
  }
}
