import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/feature/weather/infrastructure/dto/weather_model/weather_dto.dart';
part 'weather_full_entity.freezed.dart';

//Why this ENTITY?
//Because we want to separate the data layer from the domain layer.
// We grab the dto but we don't want to pass the dto to the domain layer.
// as the domain layer should not know about the dto.
//as well as the presentation layer should not know about the dto.

@freezed
sealed class WeatherFullEntity implements _$WeatherFullEntity {
  const factory WeatherFullEntity({
    @required List<WeatherInsideEntity>? weather,
    @required MainInsideEntity? main,
    @required WindInsideEntity? wind,
    @required int? dt,
    @required SysInsideEntity? sys,
    @required String? name,
    @required String? cod,
  }) = _WeatherFullEntity;

  const WeatherFullEntity._();

  factory WeatherFullEntity.fromDTO(WeatherDTO dto) {
    return WeatherFullEntity(
      weather: dto.weather
          ?.map((e) => WeatherInsideEntity(
                main: e.main,
                description: e.description,
                icon: e.icon,
              ))
          .toList(),
      main: MainInsideEntity(
        temp: dto.main?.temp,
        feelsLike: dto.main?.feelsLike,
        pressure: dto.main?.pressure,
        humidity: dto.main?.humidity,
      ),
      wind: WindInsideEntity(
        speed: dto.wind?.speed,
        gust: dto.wind?.gust,
      ),
      dt: dto.dt,
      sys: SysInsideEntity(
        sunrise: dto.sys?.sunrise,
        sunset: dto.sys?.sunset,
      ),
      name: dto.name,
      cod: dto.cod,
    );
  }
}

@freezed
sealed class MainInsideEntity implements _$MainInsideEntity {
  const factory MainInsideEntity({
    @required double? temp,
    @required double? feelsLike,
    @required int? pressure,
    @required int? humidity,
  }) = _MainInsideEntity;

  const MainInsideEntity._();
}

@freezed
sealed class SysInsideEntity implements _$SysInsideEntity {
  const factory SysInsideEntity({
    @required int? sunrise,
    @required int? sunset,
  }) = _SysInsideEntity;
  const SysInsideEntity._();
}

@freezed
sealed class WeatherInsideEntity implements _$WeatherInsideEntity {
  const factory WeatherInsideEntity({
    @required String? main,
    @required String? description,
    @required String? icon,
  }) = _WeatherInsideEntity;

  const WeatherInsideEntity._();
}

@freezed
sealed class WindInsideEntity implements _$WindInsideEntity {
  const factory WindInsideEntity({
    @required double? speed,
    @required double? gust,
  }) = _WindInsideEntity;

  const WindInsideEntity._();
}
