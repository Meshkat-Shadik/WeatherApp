import 'package:fpdart/fpdart.dart';
import 'package:weather_app/src/core/failure/app_failure.dart';
import 'package:weather_app/src/feature/weather/infrastructure/dto/weather_model/weather_dto.dart';

abstract class WeatherRepository {
  Future<Either<AppFailure, WeatherDTO>> getWeather(String cityName);
}
