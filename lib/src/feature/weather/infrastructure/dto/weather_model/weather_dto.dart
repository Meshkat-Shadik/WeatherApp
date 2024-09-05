import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/networking/freezed_string_converter.dart';

part 'weather_dto.freezed.dart';
part 'weather_dto.g.dart';

@freezed
abstract class WeatherDTO with _$WeatherDTO {
  const factory WeatherDTO({
    @required List<Weather>? weather,
    @required Main? main,
    @required Wind? wind,
    @required int? dt,
    @required Sys? sys,
    @required String? name,
    @StringConverter() @required String? cod,
  }) = _WeatherDTO;

  factory WeatherDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherDTOFromJson(json);
}

@freezed
abstract class Main with _$Main {
  const factory Main({
    @required double? temp,
    @required double? feelsLike,
    @required int? pressure,
    @required int? humidity,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
abstract class Sys with _$Sys {
  const factory Sys({
    @required int? sunrise,
    @required int? sunset,
  }) = _Sys;

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}

@freezed
abstract class Weather with _$Weather {
  const factory Weather({
    @required String? main,
    @required String? description,
    @required String? icon,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@freezed
abstract class Wind with _$Wind {
  const factory Wind({
    @required double? speed,
    @required double? gust,
  }) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
