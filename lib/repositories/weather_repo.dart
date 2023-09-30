import 'package:weatherapp/exceptions/weather_exception.dart';
import 'package:weatherapp/models/custom_error.dart';
import 'package:weatherapp/services/weather_api_services.dart';

import '../models/weather.dart';

class WeatherRepo {
  final WeatherApiServices weatherApiServices;
  WeatherRepo({
    required this.weatherApiServices,
  });

  Future<Weather> fetchWeather(String cityName) async {
    try {
      final Weather weather = await weatherApiServices.getWeather(cityName);
      final weatherMap = Weather.fromMap(weather.toMap());
      return weatherMap;
    } on WeatherException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
