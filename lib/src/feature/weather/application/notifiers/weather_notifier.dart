import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/src/core/helper/colored_logger.dart';
import 'package:weather_app/src/feature/common/states/api_state.dart';
import 'package:weather_app/src/feature/weather/application/providers.dart';
import 'package:weather_app/src/feature/weather/domain/entity/weather_full_entity.dart';

part 'weather_notifier.g.dart';

@Riverpod(keepAlive: true)
class WeatherNotifier extends _$WeatherNotifier {
  //build
  @override
  ApiRequestState<WeatherFullEntity> build() => ApiRequestState.idle();

  //getWeather
  Future<void> getWeather(String cityName) async {
    state = ApiRequestState.loading();
    ColoredLogger.Green.log('Getting weather for $cityName');
    final repo = ref.read(getWeatherRepositoryProvider);
    var data = await repo.getWeather(cityName);
    ColoredLogger.Green.log('Got weather for $cityName');
    data.fold(
      (l) {
        ColoredLogger.Red.log('Failed to get weather for $cityName');
        //we can handle error here
        state = ApiRequestState.failed(reason: l);
      },
      (r) {
        //we can handle success here
        //convert the dto to entity as we don't want dto to be exposed to the presentation layer
        state = ApiRequestState<WeatherFullEntity>.data(
          data: WeatherFullEntity.fromDTO(r),
        );
      },
    );
  }
}
