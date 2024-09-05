import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'package:weather_app/src/core/networking/url_config.dart';
import 'package:weather_app/src/feature/weather/infrastructure/dto/weather_model/weather_dto.dart';

part 'network_api_service.g.dart';

@RestApi(baseUrl: appBaseUrl)
abstract class NetworkApiService {
  factory NetworkApiService(Dio dio, {String baseUrl}) = _NetworkApiService;

  @GET("/weather")
  Future<WeatherDTO> getWeather(
    @Query("q") String cityName,
    @Query("appid") String apiKey,
    @Query("units") String units,
  );
}
