import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/feature/common/states/api_state.dart';
import 'package:weather_app/feature/weather/domain/base_repositories/base_weather_repository.dart';
import 'package:weather_app/feature/weather/domain/entity/weather_full_entity.dart';

class WeatherStateNotifer
    extends StateNotifier<ApiRequestState<WeatherFullEntity, String>> {
  final WeatherRepository weatherRepository;
  final String cityName;

  WeatherStateNotifer(
    this.weatherRepository,
    this.cityName,
  ) : super(ApiRequestState.idle()) {
    getWeather(cityName);
  }

  Future<void> getWeather(String cityName) async {
    state = ApiRequestState.loading();
    var data = await weatherRepository.getWeather(cityName);

    data.fold(
      (l) {
        //we can handle error here
        state = ApiRequestState.failed(
          reason: "${l.message}",
        );
      },
      (r) {
        //we can handle success here
        //convert the dto to entity as we don't want dto to be exposed to the presentation layer
        state = ApiRequestState<WeatherFullEntity, String>.data(
          data: WeatherFullEntity.fromDTO(r),
        );
      },
    );
  }
}
