import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/feature/weather/domain/entity/weather_full_entity.dart';
import 'package:weather_app/feature/weather/infrastructure/dto/weather_model/weather_dto.dart';
import 'package:weather_app/helper/extensions.dart';
import 'package:weather_app/networking/url_config.dart';

part 'weather_basic_entity.freezed.dart';

// WHY THis entity?
// This entity is used to pass data from one layer to another layer. more specifically from domain layer to presentation layer. and Entity should hold the data in the form of primitive data types. we Extract the data from the DTO and pass it to the Entity. and then we pass the Entity to the presentation layer. and then we extract the data from the Entity and pass it to the UI. and then we can use the data in the UI.

@freezed
sealed class WeatherBasicEntity implements _$WeatherBasicEntity {
  const factory WeatherBasicEntity({
    required String? cityName,
    required String? temp,
    required String? condition,
    required String? dateTime,
    required String? imgUrl,
    required String? feelsLike,
    required String? description,
  }) = _WeatherBasicEntity;

  const WeatherBasicEntity._();

  factory WeatherBasicEntity.fromDTO(WeatherDTO weatherData) {
    return WeatherBasicEntity(
      cityName: weatherData.name,
      temp: weatherData.main?.temp?.toStringAsFixed(1),
      condition: weatherData.weather?.first.main,
      dateTime: weatherData.dt!.toFormattedTime,
      imgUrl: '$imgBaseUrl${weatherData.weather?.first.icon}@2x.png',
      feelsLike: weatherData.main?.feelsLike?.toStringAsFixed(1),
      description: weatherData.weather?.first.description,
    );
  }

  factory WeatherBasicEntity.fromFullEntity(WeatherFullEntity weatherData) {
    return WeatherBasicEntity(
      cityName: weatherData.name,
      temp: weatherData.main?.temp?.toStringAsFixed(1),
      condition: weatherData.weather?.first.main,
      dateTime: weatherData.dt?.toFormattedTime,
      imgUrl: '$imgBaseUrl${weatherData.weather?.first.icon}@2x.png',
      feelsLike: weatherData.main?.feelsLike?.toStringAsFixed(1),
      description: weatherData.weather?.first.description,
    );
  }
}
