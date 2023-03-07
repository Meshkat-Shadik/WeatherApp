import 'package:weather_app/domain/networking/api_endpoint.dart';
import 'package:weather_app/domain/networking/api_service.dart';
import 'package:weather_app/domain/repository/base_weather_repository.dart';
import 'package:weather_app/infrastructure/Model/weather_model/weather_data.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final ApiService _apiService;
  WeatherRepositoryImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<WeatherData> getWeather(String cityName) async {
    return _apiService.getSingleData(
      endpoint: ApiEndpoint.basic(
        WeatherEndPoint.WITH_CITY_NAME,
        cityName: cityName,
      ),
      converter: (response) => WeatherData.fromJson(response),
    );
  }
}
