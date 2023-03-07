import 'package:weather_app/infrastructure/Model/weather_model/weather_data.dart';

abstract class WeatherRepository {
  Future<WeatherData> getWeather(String cityName);
}
