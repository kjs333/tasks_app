import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tasks_app/data/model/weather_model.dart';

class WeatherRepository {
  static const String _baseUrl = 'https://api.open-meteo.com/v1/forecast';

  Future<WeatherModel?> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final uri = Uri.parse(
      '$_baseUrl?latitude=$latitude&longitude=$longitude'
      '&timezone=auto&current=temperature_2m,is_day,wind_speed_10m,weather_code',
    );

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body)["current"];
        return WeatherModel.fromJson(json);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
