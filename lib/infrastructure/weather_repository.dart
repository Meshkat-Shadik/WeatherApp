import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/api/credentials.dart';
import 'package:weather_app/infrastructure/Model/weather_model/weather_data.dart';

abstract class WeatherRepository {
  Future<WeatherData> getWeather(String cityName);
}

class WeatherRepositoryImpl implements WeatherRepository {
  final http.Client _client;
  WeatherRepositoryImpl(this._client);

  @override
  Future<WeatherData> getWeather(String cityName) async {
    final http.Response response =
        await _client.get(Uri.parse(baseUrl + cityName));
    final parsedData = jsonDecode(response.body);
    final weatherData = WeatherData.fromJson(parsedData);

    return weatherData;
  }
}
