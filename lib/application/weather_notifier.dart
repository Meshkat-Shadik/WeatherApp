import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/api/api_state.dart';
import 'package:weather_app/infrastructure/weather_repository.dart';

class WeatherStateNotifer extends StateNotifier<WeatherDataState> {
  final WeatherRepository weatherRepository;
  WeatherStateNotifer(this.weatherRepository)
      : super(WeatherDataState.initial());

  Future<void> getWeather(String cityName) async {
    try {
      state = WeatherDataState.loading();
      var data = await weatherRepository.getWeather(cityName);
      state = WeatherDataState.success(data);
    } catch (e) {
      state = WeatherDataState.error("$e");
    }
  }
}
