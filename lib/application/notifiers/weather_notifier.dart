import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/application/states/api_state.dart';
import 'package:weather_app/domain/networking/network_exception.dart';
import 'package:weather_app/domain/repository/base_weather_repository.dart';
import 'package:weather_app/infrastructure/Model/weather_model/weather_data.dart';

class WeatherStateNotifer
    extends StateNotifier<ApiRequestState<WeatherData, String>> {
  final WeatherRepository weatherRepository;
  final String cityName;

  WeatherStateNotifer(
    this.weatherRepository,
    this.cityName,
  ) : super(ApiRequestState.idle()) {
    getWeather(cityName);
  }

  Future<void> getWeather(String cityName) async {
    try {
      state = ApiRequestState.loading();
      var data = await weatherRepository.getWeather(cityName);
      state = ApiRequestState<WeatherData, String>.data(data: data);
    } on NetworkException catch (e) {
      print(e.toString());
      state = ApiRequestState.failed(
        reason: "${e.message}",
      );
    }
  }
}
