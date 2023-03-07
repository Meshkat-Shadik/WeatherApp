import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/application/states/api_state.dart';
import 'package:weather_app/domain/repository/base_weather_repository.dart';
import 'package:weather_app/domain/repository/networking/network_exception.dart';
import 'package:weather_app/infrastructure/Model/weather_model/weather_data.dart';

class WeatherStateNotifer extends StateNotifier<ApiRequestState> {
  final WeatherRepository weatherRepository;
  WeatherStateNotifer(this.weatherRepository) : super(ApiRequestState.idle());

  Future<void> getWeather(String cityName) async {
    try {
      state = ApiRequestState.loading();
      var data = await weatherRepository.getWeather(cityName);
      state = ApiRequestState<WeatherData>.data(data: data);
    } on NetworkException catch (e) {
      state = ApiRequestState.failed(
        reason: "${e.message}",
      );
    }
  }
}
