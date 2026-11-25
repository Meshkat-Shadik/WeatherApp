import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/failure/app_failure.dart';
import 'package:weather_app/core/failure/failure_mapper.dart';
import 'package:weather_app/core/networking/network_api_service.dart';
import 'package:weather_app/core/networking/url_config.dart';
import 'package:weather_app/features/weather/data/entities/weather_entity.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  const WeatherRepositoryImpl(this._api);

  final NetworkApiService _api;

  @override
  Future<Either<AppFailure, WeatherEntity>> getWeather(String cityName) async {
    try {
      final dto = await _api.getWeather(cityName, apiKey, 'metric');
      return Right(WeatherEntity.fromDto(dto));
    } catch (e) {
      return Left(FailureMapper.getFailures(e));
    }
  }
}
