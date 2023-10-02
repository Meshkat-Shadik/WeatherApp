import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_dto.freezed.dart';
part 'weather_dto.g.dart';

@freezed
sealed class WeatherDTO with _$WeatherDTO {
  const factory WeatherDTO({
    @required List<Weather>? weather,
    @required Main? main,
    @required Wind? wind,
    @required int? dt,
    @required Sys? sys,
    @required String? name,
    @required int? cod,
  }) = _WeatherDTO;

  factory WeatherDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherDTOFromJson(json);
}

@freezed
sealed class Main with _$Main {
  const factory Main({
    @required double? temp,
    @required double? feelsLike,
    @required int? pressure,
    @required int? humidity,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
sealed class Sys with _$Sys {
  const factory Sys({
    @required int? sunrise,
    @required int? sunset,
  }) = _Sys;

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}

@freezed
sealed class Weather with _$Weather {
  const factory Weather({
    @required String? main,
    @required String? description,
    @required String? icon,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@freezed
sealed class Wind with _$Wind {
  const factory Wind({
    @required double? speed,
    @required double? gust,
  }) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
