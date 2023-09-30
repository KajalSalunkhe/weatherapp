import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherapp/repositories/weather_repo.dart';

import '../../models/custom_error.dart';
import '../../models/weather.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepo weatherRepo;
  WeatherCubit({required this.weatherRepo}) : super(WeatherState.initial());

  Future<void> fetchWeather(String cityName) async {
    emit(state.copyWith(status: WeatherStatus.loading));
    try {
      await weatherRepo.fetchWeather(cityName).then((weather) {
        emit(state.copyWith(
          status: WeatherStatus.loaded,
          weather: weather,
        ));
      });
    } catch (e) {
      emit(state.copyWith(
        status: WeatherStatus.error,
        // error: e,
      ));
    }
  }
}
