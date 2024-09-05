import 'package:fpdart/fpdart.dart';
import 'package:weather_app/src/core/failure/app_failure.dart';
import 'package:weather_app/src/core/failure/failure_mapper.dart';
import 'package:weather_app/src/core/helper/colored_logger.dart';
import 'package:weather_app/src/core/networking/network_api_service.dart';
import 'package:weather_app/src/core/networking/url_config.dart';
import 'package:weather_app/src/feature/weather/domain/base_repositories/base_weather_repository.dart';
import 'package:weather_app/src/feature/weather/infrastructure/dto/weather_model/weather_dto.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final NetworkApiService _apiService;
  WeatherRepositoryImpl({required NetworkApiService apiService})
      : _apiService = apiService;

  @override
  Future<Either<AppFailure, WeatherDTO>> getWeather(
    String cityName,
  ) async {
    try {
      final response = await _apiService.getWeather(cityName, apiKey, "metric");
      ColoredLogger.Green.log("Response: $response");
      return Right(response);
    } on Exception catch (e) {
      ColoredLogger.Red.log("Exception: $e");
      return Left(FailureMapper.getFailures(e));
    }
  }
}
