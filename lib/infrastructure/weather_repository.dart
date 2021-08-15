import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:weather_app/api/credentials.dart';
import 'package:weather_app/infrastructure/Model/weather_model/weather_data.dart';
import 'package:weather_app/infrastructure/failures.dart';

abstract class WeatherRepository {
  Future<WeatherData> getWeather(String cityName);
}

class WeatherRepositoryImpl implements WeatherRepository {
  final http.Client _client;
  WeatherRepositoryImpl(this._client);

  @override
  Future<WeatherData> getWeather(String cityName) async {
    try {
      final http.Response response =
          await _client.get(Uri.parse(baseUrl + cityName));
      if (response.statusCode == 200) {
        final parsedData = jsonDecode(response.body);
        final weatherData = WeatherData.fromJson(parsedData);
        return weatherData;
      } else if (response.statusCode == 404) {
        throw Failure("City Not Found");
      } else {
        throw Failure("Check Internet Connection / GPS");
      }
    } on SocketException {
      throw Failure("Check Internet Connection / GPS");
    }
  }
}
