import 'package:fpdart/fpdart.dart';
import 'package:weather_app/feature/weather/infrastructure/dto/weather_model/weather_dto.dart';
import 'package:weather_app/networking/network_exception.dart';

abstract class WeatherRepository {
  Future<Either<NetworkException, WeatherDTO>> getWeather(String cityName);
}
