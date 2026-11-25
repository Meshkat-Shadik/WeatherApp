import 'package:equatable/equatable.dart';
import 'package:weather_app/core/networking/url_config.dart';
import 'package:weather_app/features/weather/data/dto/weather_dto.dart';

/// What the app knows about a city's weather — DTO nullability resolved,
/// unix seconds turned into [DateTime]s. Formatting is presentation's job.
class const WeatherEntity({
  required final String cityName,
  required final String condition,
  required final String description,
  required final double temperature,
  required final double feelsLike,
  required final int humidity,
  required final int pressure,
  required final double windSpeed,
  final double? windGust,
  final String? iconUrl,
  final DateTime? observedAt,
  final DateTime? sunrise,
  final DateTime? sunset,
}) extends Equatable {
  factory WeatherEntity.fromDto(WeatherDto dto) {
    final condition = dto.weather?.firstOrNull;
    return WeatherEntity(
      cityName: dto.name ?? '',
      condition: condition?.main ?? '',
      description: condition?.description ?? '',
      iconUrl: switch (condition?.icon) {
        final String icon => '$imgBaseUrl$icon@2x.png',
        null => null,
      },
      temperature: dto.main?.temp ?? 0,
      feelsLike: dto.main?.feelsLike ?? 0,
      humidity: dto.main?.humidity ?? 0,
      pressure: dto.main?.pressure ?? 0,
      windSpeed: dto.wind?.speed ?? 0,
      windGust: dto.wind?.gust,
      observedAt: _time(dto.dt),
      sunrise: _time(dto.sys?.sunrise),
      sunset: _time(dto.sys?.sunset),
    );
  }

  WeatherEntity copyWith({
    String? cityName,
    String? condition,
    String? description,
    double? temperature,
    double? feelsLike,
    int? humidity,
    int? pressure,
    double? windSpeed,
    double? windGust,
    String? iconUrl,
    DateTime? observedAt,
    DateTime? sunrise,
    DateTime? sunset,
  }) => WeatherEntity(
    cityName: cityName ?? this.cityName,
    condition: condition ?? this.condition,
    description: description ?? this.description,
    temperature: temperature ?? this.temperature,
    feelsLike: feelsLike ?? this.feelsLike,
    humidity: humidity ?? this.humidity,
    pressure: pressure ?? this.pressure,
    windSpeed: windSpeed ?? this.windSpeed,
    windGust: windGust ?? this.windGust,
    iconUrl: iconUrl ?? this.iconUrl,
    observedAt: observedAt ?? this.observedAt,
    sunrise: sunrise ?? this.sunrise,
    sunset: sunset ?? this.sunset,
  );

  @override
  List<Object?> get props => [
    cityName,
    condition,
    description,
    temperature,
    feelsLike,
    humidity,
    pressure,
    windSpeed,
    windGust,
    iconUrl,
    observedAt,
    sunrise,
    sunset,
  ];

  static DateTime? _time(int? unixSeconds) => switch (unixSeconds) {
    final int s => DateTime.fromMillisecondsSinceEpoch(s * 1000),
    null => null,
  };
}
