import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather.dart';

class WeatherApiServices {
  Future<Weather> getWeather(String city) async {
    final String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final weather = Weather.fromJson(json.decode(response.body));
        return weather;
      } else {
        throw Exception('Failed to fetch weather data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
