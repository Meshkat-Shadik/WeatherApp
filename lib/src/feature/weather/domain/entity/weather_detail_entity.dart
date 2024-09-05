import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/core/helper/extensions.dart';
import 'package:weather_app/src/feature/weather/domain/entity/weather_full_entity.dart';
import 'package:weather_app/src/feature/weather/infrastructure/dto/weather_model/weather_dto.dart';

part 'weather_detail_entity.freezed.dart';

@freezed
sealed class WeatherDetailEntity implements _$WeatherDetailEntity {
  const WeatherDetailEntity._();

  const factory WeatherDetailEntity({
    required String? windValue,
    required String? humidityValue,
    required String? gustValue,
    required String? pressureValue,
    required String? sunriseValue,
    required String? sunsetValue,
  }) = _WeatherDetailEntity;

  factory WeatherDetailEntity.fromDTO(WeatherDTO weatherData) {
    return WeatherDetailEntity(
      windValue: weatherData.wind?.speed.toString(),
      humidityValue: weatherData.main?.humidity.toString(),
      gustValue: weatherData.wind?.gust.toString(),
      pressureValue: weatherData.main?.pressure.toString(),
      sunriseValue: (weatherData.sys?.sunrise! ?? 0).toFormattedTime,
      sunsetValue: (weatherData.sys?.sunset! ?? 0).toFormattedTime,
    );
  }

  factory WeatherDetailEntity.fromFullEntity(WeatherFullEntity weatherData) {
    return WeatherDetailEntity(
      windValue: weatherData.wind?.speed.toString(),
      humidityValue: weatherData.main?.humidity.toString(),
      gustValue: weatherData.wind?.gust.toString(),
      pressureValue: weatherData.main?.pressure.toString(),
      sunriseValue: weatherData.sys?.sunrise?.toFormattedTime,
      sunsetValue: weatherData.sys?.sunset?.toFormattedTime,
    );
  }
}
