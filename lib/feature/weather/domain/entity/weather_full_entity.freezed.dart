// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_full_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherFullEntity {
  List<WeatherInsideEntity>? get weather => throw _privateConstructorUsedError;
  MainInsideEntity? get main => throw _privateConstructorUsedError;
  WindInsideEntity? get wind => throw _privateConstructorUsedError;
  int? get dt => throw _privateConstructorUsedError;
  SysInsideEntity? get sys => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get cod => throw _privateConstructorUsedError;
}

/// @nodoc

class _$_WeatherFullEntity extends _WeatherFullEntity {
  const _$_WeatherFullEntity(
      {final List<WeatherInsideEntity>? weather,
      this.main,
      this.wind,
      this.dt,
      this.sys,
      this.name,
      this.cod})
      : _weather = weather,
        super._();

  final List<WeatherInsideEntity>? _weather;
  @override
  List<WeatherInsideEntity>? get weather {
    final value = _weather;
    if (value == null) return null;
    if (_weather is EqualUnmodifiableListView) return _weather;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final MainInsideEntity? main;
  @override
  final WindInsideEntity? wind;
  @override
  final int? dt;
  @override
  final SysInsideEntity? sys;
  @override
  final String? name;
  @override
  final String? cod;

  @override
  String toString() {
    return 'WeatherFullEntity(weather: $weather, main: $main, wind: $wind, dt: $dt, sys: $sys, name: $name, cod: $cod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherFullEntity &&
            const DeepCollectionEquality().equals(other._weather, _weather) &&
            (identical(other.main, main) || other.main == main) &&
            (identical(other.wind, wind) || other.wind == wind) &&
            (identical(other.dt, dt) || other.dt == dt) &&
            (identical(other.sys, sys) || other.sys == sys) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cod, cod) || other.cod == cod));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_weather),
      main,
      wind,
      dt,
      sys,
      name,
      cod);
}

abstract class _WeatherFullEntity extends WeatherFullEntity {
  const factory _WeatherFullEntity(
      {final List<WeatherInsideEntity>? weather,
      final MainInsideEntity? main,
      final WindInsideEntity? wind,
      final int? dt,
      final SysInsideEntity? sys,
      final String? name,
      final String? cod}) = _$_WeatherFullEntity;
  const _WeatherFullEntity._() : super._();

  @override
  List<WeatherInsideEntity>? get weather;
  @override
  MainInsideEntity? get main;
  @override
  WindInsideEntity? get wind;
  @override
  int? get dt;
  @override
  SysInsideEntity? get sys;
  @override
  String? get name;
  @override
  String? get cod;
}

/// @nodoc
mixin _$MainInsideEntity {
  double? get temp => throw _privateConstructorUsedError;
  double? get feelsLike => throw _privateConstructorUsedError;
  int? get pressure => throw _privateConstructorUsedError;
  int? get humidity => throw _privateConstructorUsedError;
}

/// @nodoc

class _$_MainInsideEntity extends _MainInsideEntity {
  const _$_MainInsideEntity(
      {this.temp, this.feelsLike, this.pressure, this.humidity})
      : super._();

  @override
  final double? temp;
  @override
  final double? feelsLike;
  @override
  final int? pressure;
  @override
  final int? humidity;

  @override
  String toString() {
    return 'MainInsideEntity(temp: $temp, feelsLike: $feelsLike, pressure: $pressure, humidity: $humidity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainInsideEntity &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.feelsLike, feelsLike) ||
                other.feelsLike == feelsLike) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, temp, feelsLike, pressure, humidity);
}

abstract class _MainInsideEntity extends MainInsideEntity {
  const factory _MainInsideEntity(
      {final double? temp,
      final double? feelsLike,
      final int? pressure,
      final int? humidity}) = _$_MainInsideEntity;
  const _MainInsideEntity._() : super._();

  @override
  double? get temp;
  @override
  double? get feelsLike;
  @override
  int? get pressure;
  @override
  int? get humidity;
}

/// @nodoc
mixin _$SysInsideEntity {
  int? get sunrise => throw _privateConstructorUsedError;
  int? get sunset => throw _privateConstructorUsedError;
}

/// @nodoc

class _$_SysInsideEntity extends _SysInsideEntity {
  const _$_SysInsideEntity({this.sunrise, this.sunset}) : super._();

  @override
  final int? sunrise;
  @override
  final int? sunset;

  @override
  String toString() {
    return 'SysInsideEntity(sunrise: $sunrise, sunset: $sunset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SysInsideEntity &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.sunset, sunset) || other.sunset == sunset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sunrise, sunset);
}

abstract class _SysInsideEntity extends SysInsideEntity {
  const factory _SysInsideEntity({final int? sunrise, final int? sunset}) =
      _$_SysInsideEntity;
  const _SysInsideEntity._() : super._();

  @override
  int? get sunrise;
  @override
  int? get sunset;
}

/// @nodoc
mixin _$WeatherInsideEntity {
  String? get main => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
}

/// @nodoc

class _$_WeatherInsideEntity extends _WeatherInsideEntity {
  const _$_WeatherInsideEntity({this.main, this.description, this.icon})
      : super._();

  @override
  final String? main;
  @override
  final String? description;
  @override
  final String? icon;

  @override
  String toString() {
    return 'WeatherInsideEntity(main: $main, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherInsideEntity &&
            (identical(other.main, main) || other.main == main) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, main, description, icon);
}

abstract class _WeatherInsideEntity extends WeatherInsideEntity {
  const factory _WeatherInsideEntity(
      {final String? main,
      final String? description,
      final String? icon}) = _$_WeatherInsideEntity;
  const _WeatherInsideEntity._() : super._();

  @override
  String? get main;
  @override
  String? get description;
  @override
  String? get icon;
}

/// @nodoc
mixin _$WindInsideEntity {
  double? get speed => throw _privateConstructorUsedError;
  double? get gust => throw _privateConstructorUsedError;
}

/// @nodoc

class _$_WindInsideEntity extends _WindInsideEntity {
  const _$_WindInsideEntity({this.speed, this.gust}) : super._();

  @override
  final double? speed;
  @override
  final double? gust;

  @override
  String toString() {
    return 'WindInsideEntity(speed: $speed, gust: $gust)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WindInsideEntity &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.gust, gust) || other.gust == gust));
  }

  @override
  int get hashCode => Object.hash(runtimeType, speed, gust);
}

abstract class _WindInsideEntity extends WindInsideEntity {
  const factory _WindInsideEntity({final double? speed, final double? gust}) =
      _$_WindInsideEntity;
  const _WindInsideEntity._() : super._();

  @override
  double? get speed;
  @override
  double? get gust;
}
