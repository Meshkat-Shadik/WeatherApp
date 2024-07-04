import 'package:fpdart/fpdart.dart';
import 'package:weather_app/failure/app_failure.dart';
import 'package:weather_app/failure/failure_mapper.dart';
import 'package:weather_app/feature/weather/domain/base_repositories/base_weather_repository.dart';
import 'package:weather_app/feature/weather/infrastructure/dto/weather_model/weather_dto.dart';
import 'package:weather_app/helper/colored_logger.dart';
import 'package:weather_app/networking/network_api_service.dart';
import 'package:weather_app/networking/url_config.dart';

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
