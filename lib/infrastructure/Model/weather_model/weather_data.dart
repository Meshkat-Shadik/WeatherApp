// To parse this JSON data, do
//
//     final weatherData = weatherDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'weather_data.freezed.dart';
part 'weather_data.g.dart';

WeatherData weatherDataFromJson(String str) =>
    WeatherData.fromJson(json.decode(str));

String weatherDataToJson(WeatherData data) => json.encode(data.toJson());

@freezed
abstract class WeatherData with _$WeatherData {
  const factory WeatherData({
    @required List<Weather>? weather,
    @required Main? main,
    @required Wind? wind,
    @required int? dt,
    @required Sys? sys,
    @required String? name,
    @required int? cod,
  }) = _WeatherData;

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
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
