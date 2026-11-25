import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/failure/app_failure.dart';
import 'package:weather_app/features/weather/data/entities/weather_entity.dart';

abstract interface class WeatherRepository {
  Future<Either<AppFailure, WeatherEntity>> getWeather(String cityName);
}
