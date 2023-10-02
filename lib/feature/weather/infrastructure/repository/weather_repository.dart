import 'package:fpdart/fpdart.dart';
import 'package:weather_app/feature/weather/domain/base_repositories/base_weather_repository.dart';
import 'package:weather_app/feature/weather/infrastructure/dto/weather_model/weather_dto.dart';
import 'package:weather_app/networking/api_endpoint.dart';
import 'package:weather_app/networking/api_service.dart';
import 'package:weather_app/networking/network_exception.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final ApiService _apiService;
  WeatherRepositoryImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Either<NetworkException, WeatherDTO>> getWeather(
    String cityName,
  ) async {
    return _apiService.getSingleData(
      endpoint: ApiEndpoint.basic(
        WeatherEndPoint.WITH_CITY_NAME,
        cityName: cityName,
      ),
      converter: (response) => WeatherDTO.fromJson(response),
    );
  }
}
