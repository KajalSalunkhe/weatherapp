import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/temp_settings/temp_settings_cubit.dart';
import 'package:weatherapp/cubits/text_theme/text_theme_cubit.dart';
import 'package:weatherapp/cubits/weather/weather_cubit.dart';
import 'package:weatherapp/pages/splash_screen.dart';
import 'package:weatherapp/repositories/weather_repo.dart';
import 'package:weatherapp/services/weather_api_services.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => WeatherRepo(
        weatherApiServices: WeatherApiServices(),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<WeatherCubit>(
            create: (context) => WeatherCubit(
              weatherRepo: context.read<WeatherRepo>(),
            ),
          ),
          BlocProvider<TempSettingsCubit>(
            create: (context) => TempSettingsCubit(),
          ),
          BlocProvider<TextThemeCubit>(
            create: (context) => TextThemeCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'Weather Apps',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
