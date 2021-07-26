// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherData _$_$_WeatherDataFromJson(Map<String, dynamic> json) {
  return _$_WeatherData(
    weather: (json['weather'] as List<dynamic>)
        .map((e) =>
            e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
        .toList(),
    base: json['base'] as String,
    main: Main.fromJson(json['main'] as Map<String, dynamic>),
    name: json['name'] as String,
    dt: json['dt'] as int?,
    cod: json['cod'] as int,
  );
}

Map<String, dynamic> _$_$_WeatherDataToJson(_$_WeatherData instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.main,
      'name': instance.name,
      'dt': instance.dt,
      'cod': instance.cod,
    };

_$_WeatherErrorData _$_$_WeatherErrorDataFromJson(Map<String, dynamic> json) {
  return _$_WeatherErrorData(
    message: json['message'] as String,
    cod: json['cod'] as int,
  );
}

Map<String, dynamic> _$_$_WeatherErrorDataToJson(
        _$_WeatherErrorData instance) =>
    <String, dynamic>{
      'message': instance.message,
      'cod': instance.cod,
    };

_$_Main _$_$_MainFromJson(Map<String, dynamic> json) {
  return _$_Main(
    temp: (json['temp'] as num?)?.toDouble(),
    pressure: json['pressure'] as int?,
    humidity: json['humidity'] as int?,
    tempMin: (json['tempMin'] as num?)?.toDouble(),
    tempMax: (json['tempMax'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_MainToJson(_$_Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
    };

_$_Weather _$_$_WeatherFromJson(Map<String, dynamic> json) {
  return _$_Weather(
    main: json['main'] as String?,
    description: json['description'] as String?,
    icon: json['icon'] as String?,
  );
}

Map<String, dynamic> _$_$_WeatherToJson(_$_Weather instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
