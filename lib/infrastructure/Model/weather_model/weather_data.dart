import 'package:json_annotation/json_annotation.dart';
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
    required List<Weather?> weather,
    required String base,
    required Main main,
    required String name,
    int? dt,
    required int cod,
  }) = _WeatherData;

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
}

@freezed
abstract class WeatherErrorData with _$WeatherErrorData {
  const factory WeatherErrorData({
    required String message,
    required int cod,
  }) = _WeatherErrorData;

  factory WeatherErrorData.fromJson(Map<String, dynamic> json) =>
      _$WeatherErrorDataFromJson(json);
}

@freezed
abstract class Main with _$Main {
  const factory Main({
    double? temp,
    int? pressure,
    int? humidity,
    double? tempMin,
    double? tempMax,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
abstract class Weather with _$Weather {
  const factory Weather({
    String? main,
    String? description,
    String? icon,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
