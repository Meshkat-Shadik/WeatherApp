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
  int? get cod => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherFullEntityCopyWith<WeatherFullEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherFullEntityCopyWith<$Res> {
  factory $WeatherFullEntityCopyWith(
          WeatherFullEntity value, $Res Function(WeatherFullEntity) then) =
      _$WeatherFullEntityCopyWithImpl<$Res, WeatherFullEntity>;
  @useResult
  $Res call(
      {List<WeatherInsideEntity>? weather,
      MainInsideEntity? main,
      WindInsideEntity? wind,
      int? dt,
      SysInsideEntity? sys,
      String? name,
      int? cod});

  $MainInsideEntityCopyWith<$Res>? get main;
  $WindInsideEntityCopyWith<$Res>? get wind;
  $SysInsideEntityCopyWith<$Res>? get sys;
}

/// @nodoc
class _$WeatherFullEntityCopyWithImpl<$Res, $Val extends WeatherFullEntity>
    implements $WeatherFullEntityCopyWith<$Res> {
  _$WeatherFullEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = freezed,
    Object? main = freezed,
    Object? wind = freezed,
    Object? dt = freezed,
    Object? sys = freezed,
    Object? name = freezed,
    Object? cod = freezed,
  }) {
    return _then(_value.copyWith(
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherInsideEntity>?,
      main: freezed == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as MainInsideEntity?,
      wind: freezed == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as WindInsideEntity?,
      dt: freezed == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int?,
      sys: freezed == sys
          ? _value.sys
          : sys // ignore: cast_nullable_to_non_nullable
              as SysInsideEntity?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MainInsideEntityCopyWith<$Res>? get main {
    if (_value.main == null) {
      return null;
    }

    return $MainInsideEntityCopyWith<$Res>(_value.main!, (value) {
      return _then(_value.copyWith(main: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WindInsideEntityCopyWith<$Res>? get wind {
    if (_value.wind == null) {
      return null;
    }

    return $WindInsideEntityCopyWith<$Res>(_value.wind!, (value) {
      return _then(_value.copyWith(wind: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SysInsideEntityCopyWith<$Res>? get sys {
    if (_value.sys == null) {
      return null;
    }

    return $SysInsideEntityCopyWith<$Res>(_value.sys!, (value) {
      return _then(_value.copyWith(sys: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeatherFullEntityCopyWith<$Res>
    implements $WeatherFullEntityCopyWith<$Res> {
  factory _$$_WeatherFullEntityCopyWith(_$_WeatherFullEntity value,
          $Res Function(_$_WeatherFullEntity) then) =
      __$$_WeatherFullEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<WeatherInsideEntity>? weather,
      MainInsideEntity? main,
      WindInsideEntity? wind,
      int? dt,
      SysInsideEntity? sys,
      String? name,
      int? cod});

  @override
  $MainInsideEntityCopyWith<$Res>? get main;
  @override
  $WindInsideEntityCopyWith<$Res>? get wind;
  @override
  $SysInsideEntityCopyWith<$Res>? get sys;
}

/// @nodoc
class __$$_WeatherFullEntityCopyWithImpl<$Res>
    extends _$WeatherFullEntityCopyWithImpl<$Res, _$_WeatherFullEntity>
    implements _$$_WeatherFullEntityCopyWith<$Res> {
  __$$_WeatherFullEntityCopyWithImpl(
      _$_WeatherFullEntity _value, $Res Function(_$_WeatherFullEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = freezed,
    Object? main = freezed,
    Object? wind = freezed,
    Object? dt = freezed,
    Object? sys = freezed,
    Object? name = freezed,
    Object? cod = freezed,
  }) {
    return _then(_$_WeatherFullEntity(
      weather: freezed == weather
          ? _value._weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherInsideEntity>?,
      main: freezed == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as MainInsideEntity?,
      wind: freezed == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as WindInsideEntity?,
      dt: freezed == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int?,
      sys: freezed == sys
          ? _value.sys
          : sys // ignore: cast_nullable_to_non_nullable
              as SysInsideEntity?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
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
  final int? cod;

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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherFullEntityCopyWith<_$_WeatherFullEntity> get copyWith =>
      __$$_WeatherFullEntityCopyWithImpl<_$_WeatherFullEntity>(
          this, _$identity);
}

abstract class _WeatherFullEntity extends WeatherFullEntity {
  const factory _WeatherFullEntity(
      {final List<WeatherInsideEntity>? weather,
      final MainInsideEntity? main,
      final WindInsideEntity? wind,
      final int? dt,
      final SysInsideEntity? sys,
      final String? name,
      final int? cod}) = _$_WeatherFullEntity;
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
  int? get cod;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherFullEntityCopyWith<_$_WeatherFullEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MainInsideEntity {
  double? get temp => throw _privateConstructorUsedError;
  double? get feelsLike => throw _privateConstructorUsedError;
  int? get pressure => throw _privateConstructorUsedError;
  int? get humidity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainInsideEntityCopyWith<MainInsideEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainInsideEntityCopyWith<$Res> {
  factory $MainInsideEntityCopyWith(
          MainInsideEntity value, $Res Function(MainInsideEntity) then) =
      _$MainInsideEntityCopyWithImpl<$Res, MainInsideEntity>;
  @useResult
  $Res call({double? temp, double? feelsLike, int? pressure, int? humidity});
}

/// @nodoc
class _$MainInsideEntityCopyWithImpl<$Res, $Val extends MainInsideEntity>
    implements $MainInsideEntityCopyWith<$Res> {
  _$MainInsideEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = freezed,
    Object? feelsLike = freezed,
    Object? pressure = freezed,
    Object? humidity = freezed,
  }) {
    return _then(_value.copyWith(
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double?,
      feelsLike: freezed == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double?,
      pressure: freezed == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as int?,
      humidity: freezed == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainInsideEntityCopyWith<$Res>
    implements $MainInsideEntityCopyWith<$Res> {
  factory _$$_MainInsideEntityCopyWith(
          _$_MainInsideEntity value, $Res Function(_$_MainInsideEntity) then) =
      __$$_MainInsideEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? temp, double? feelsLike, int? pressure, int? humidity});
}

/// @nodoc
class __$$_MainInsideEntityCopyWithImpl<$Res>
    extends _$MainInsideEntityCopyWithImpl<$Res, _$_MainInsideEntity>
    implements _$$_MainInsideEntityCopyWith<$Res> {
  __$$_MainInsideEntityCopyWithImpl(
      _$_MainInsideEntity _value, $Res Function(_$_MainInsideEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = freezed,
    Object? feelsLike = freezed,
    Object? pressure = freezed,
    Object? humidity = freezed,
  }) {
    return _then(_$_MainInsideEntity(
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double?,
      feelsLike: freezed == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double?,
      pressure: freezed == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as int?,
      humidity: freezed == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainInsideEntityCopyWith<_$_MainInsideEntity> get copyWith =>
      __$$_MainInsideEntityCopyWithImpl<_$_MainInsideEntity>(this, _$identity);
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
  @override
  @JsonKey(ignore: true)
  _$$_MainInsideEntityCopyWith<_$_MainInsideEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SysInsideEntity {
  int? get sunrise => throw _privateConstructorUsedError;
  int? get sunset => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SysInsideEntityCopyWith<SysInsideEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SysInsideEntityCopyWith<$Res> {
  factory $SysInsideEntityCopyWith(
          SysInsideEntity value, $Res Function(SysInsideEntity) then) =
      _$SysInsideEntityCopyWithImpl<$Res, SysInsideEntity>;
  @useResult
  $Res call({int? sunrise, int? sunset});
}

/// @nodoc
class _$SysInsideEntityCopyWithImpl<$Res, $Val extends SysInsideEntity>
    implements $SysInsideEntityCopyWith<$Res> {
  _$SysInsideEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sunrise = freezed,
    Object? sunset = freezed,
  }) {
    return _then(_value.copyWith(
      sunrise: freezed == sunrise
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as int?,
      sunset: freezed == sunset
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SysInsideEntityCopyWith<$Res>
    implements $SysInsideEntityCopyWith<$Res> {
  factory _$$_SysInsideEntityCopyWith(
          _$_SysInsideEntity value, $Res Function(_$_SysInsideEntity) then) =
      __$$_SysInsideEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? sunrise, int? sunset});
}

/// @nodoc
class __$$_SysInsideEntityCopyWithImpl<$Res>
    extends _$SysInsideEntityCopyWithImpl<$Res, _$_SysInsideEntity>
    implements _$$_SysInsideEntityCopyWith<$Res> {
  __$$_SysInsideEntityCopyWithImpl(
      _$_SysInsideEntity _value, $Res Function(_$_SysInsideEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sunrise = freezed,
    Object? sunset = freezed,
  }) {
    return _then(_$_SysInsideEntity(
      sunrise: freezed == sunrise
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as int?,
      sunset: freezed == sunset
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SysInsideEntityCopyWith<_$_SysInsideEntity> get copyWith =>
      __$$_SysInsideEntityCopyWithImpl<_$_SysInsideEntity>(this, _$identity);
}

abstract class _SysInsideEntity extends SysInsideEntity {
  const factory _SysInsideEntity({final int? sunrise, final int? sunset}) =
      _$_SysInsideEntity;
  const _SysInsideEntity._() : super._();

  @override
  int? get sunrise;
  @override
  int? get sunset;
  @override
  @JsonKey(ignore: true)
  _$$_SysInsideEntityCopyWith<_$_SysInsideEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WeatherInsideEntity {
  String? get main => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherInsideEntityCopyWith<WeatherInsideEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherInsideEntityCopyWith<$Res> {
  factory $WeatherInsideEntityCopyWith(
          WeatherInsideEntity value, $Res Function(WeatherInsideEntity) then) =
      _$WeatherInsideEntityCopyWithImpl<$Res, WeatherInsideEntity>;
  @useResult
  $Res call({String? main, String? description, String? icon});
}

/// @nodoc
class _$WeatherInsideEntityCopyWithImpl<$Res, $Val extends WeatherInsideEntity>
    implements $WeatherInsideEntityCopyWith<$Res> {
  _$WeatherInsideEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? main = freezed,
    Object? description = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      main: freezed == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeatherInsideEntityCopyWith<$Res>
    implements $WeatherInsideEntityCopyWith<$Res> {
  factory _$$_WeatherInsideEntityCopyWith(_$_WeatherInsideEntity value,
          $Res Function(_$_WeatherInsideEntity) then) =
      __$$_WeatherInsideEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? main, String? description, String? icon});
}

/// @nodoc
class __$$_WeatherInsideEntityCopyWithImpl<$Res>
    extends _$WeatherInsideEntityCopyWithImpl<$Res, _$_WeatherInsideEntity>
    implements _$$_WeatherInsideEntityCopyWith<$Res> {
  __$$_WeatherInsideEntityCopyWithImpl(_$_WeatherInsideEntity _value,
      $Res Function(_$_WeatherInsideEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? main = freezed,
    Object? description = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$_WeatherInsideEntity(
      main: freezed == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherInsideEntityCopyWith<_$_WeatherInsideEntity> get copyWith =>
      __$$_WeatherInsideEntityCopyWithImpl<_$_WeatherInsideEntity>(
          this, _$identity);
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
  @override
  @JsonKey(ignore: true)
  _$$_WeatherInsideEntityCopyWith<_$_WeatherInsideEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WindInsideEntity {
  double? get speed => throw _privateConstructorUsedError;
  double? get gust => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WindInsideEntityCopyWith<WindInsideEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WindInsideEntityCopyWith<$Res> {
  factory $WindInsideEntityCopyWith(
          WindInsideEntity value, $Res Function(WindInsideEntity) then) =
      _$WindInsideEntityCopyWithImpl<$Res, WindInsideEntity>;
  @useResult
  $Res call({double? speed, double? gust});
}

/// @nodoc
class _$WindInsideEntityCopyWithImpl<$Res, $Val extends WindInsideEntity>
    implements $WindInsideEntityCopyWith<$Res> {
  _$WindInsideEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? speed = freezed,
    Object? gust = freezed,
  }) {
    return _then(_value.copyWith(
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      gust: freezed == gust
          ? _value.gust
          : gust // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WindInsideEntityCopyWith<$Res>
    implements $WindInsideEntityCopyWith<$Res> {
  factory _$$_WindInsideEntityCopyWith(
          _$_WindInsideEntity value, $Res Function(_$_WindInsideEntity) then) =
      __$$_WindInsideEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? speed, double? gust});
}

/// @nodoc
class __$$_WindInsideEntityCopyWithImpl<$Res>
    extends _$WindInsideEntityCopyWithImpl<$Res, _$_WindInsideEntity>
    implements _$$_WindInsideEntityCopyWith<$Res> {
  __$$_WindInsideEntityCopyWithImpl(
      _$_WindInsideEntity _value, $Res Function(_$_WindInsideEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? speed = freezed,
    Object? gust = freezed,
  }) {
    return _then(_$_WindInsideEntity(
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      gust: freezed == gust
          ? _value.gust
          : gust // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WindInsideEntityCopyWith<_$_WindInsideEntity> get copyWith =>
      __$$_WindInsideEntityCopyWithImpl<_$_WindInsideEntity>(this, _$identity);
}

abstract class _WindInsideEntity extends WindInsideEntity {
  const factory _WindInsideEntity({final double? speed, final double? gust}) =
      _$_WindInsideEntity;
  const _WindInsideEntity._() : super._();

  @override
  double? get speed;
  @override
  double? get gust;
  @override
  @JsonKey(ignore: true)
  _$$_WindInsideEntityCopyWith<_$_WindInsideEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
