import 'package:fpdart/fpdart.dart';
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

    state = switch (data) {
      Left(value: final l) => ApiRequestState.failed(reason: l),
      Right(value: final r) => ApiRequestState<WeatherFullEntity>.data(
          data: WeatherFullEntity.fromDTO(r),
        ),
    };
  }
}
