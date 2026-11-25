// Wire format of OpenWeather `/weather`. Hand-written fromJson: five small
// classes don't justify a json_serializable build step.
class WeatherDto {
  const WeatherDto({
    this.weather,
    this.main,
    this.wind,
    this.dt,
    this.sys,
    this.name,
    this.cod,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) => WeatherDto(
    weather: (json['weather'] as List<dynamic>?)
        ?.map((e) => WeatherConditionDto.fromJson(e as Map<String, dynamic>))
        .toList(),
    main: _obj(json['main'], MainDto.fromJson),
    wind: _obj(json['wind'], WindDto.fromJson),
    dt: json['dt'] as int?,
    sys: _obj(json['sys'], SysDto.fromJson),
    name: json['name'] as String?,
    cod: json['cod']?.toString(), // int on success, string on errors
  );

  final List<WeatherConditionDto>? weather;
  final MainDto? main;
  final WindDto? wind;
  final int? dt;
  final SysDto? sys;
  final String? name;
  final String? cod;
}

class MainDto {
  const MainDto({this.temp, this.feelsLike, this.pressure, this.humidity});

  factory MainDto.fromJson(Map<String, dynamic> json) => MainDto(
    temp: (json['temp'] as num?)?.toDouble(),
    feelsLike: (json['feels_like'] as num?)?.toDouble(),
    pressure: (json['pressure'] as num?)?.toInt(),
    humidity: (json['humidity'] as num?)?.toInt(),
  );

  final double? temp;
  final double? feelsLike;
  final int? pressure;
  final int? humidity;
}

class SysDto {
  const SysDto({this.sunrise, this.sunset});

  factory SysDto.fromJson(Map<String, dynamic> json) =>
      SysDto(sunrise: json['sunrise'] as int?, sunset: json['sunset'] as int?);

  final int? sunrise;
  final int? sunset;
}

class WeatherConditionDto {
  const WeatherConditionDto({this.main, this.description, this.icon});

  factory WeatherConditionDto.fromJson(Map<String, dynamic> json) =>
      WeatherConditionDto(
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  final String? main;
  final String? description;
  final String? icon;
}

class WindDto {
  const WindDto({this.speed, this.gust});

  factory WindDto.fromJson(Map<String, dynamic> json) => WindDto(
    speed: (json['speed'] as num?)?.toDouble(),
    gust: (json['gust'] as num?)?.toDouble(),
  );

  final double? speed;
  final double? gust;
}

T? _obj<T>(Object? json, T Function(Map<String, dynamic>) fromJson) =>
    json is Map<String, dynamic> ? fromJson(json) : null;
