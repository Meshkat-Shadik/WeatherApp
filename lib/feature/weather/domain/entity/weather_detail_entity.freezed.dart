// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_detail_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherDetailEntity {
  String? get windValue => throw _privateConstructorUsedError;
  String? get humidityValue => throw _privateConstructorUsedError;
  String? get gustValue => throw _privateConstructorUsedError;
  String? get pressureValue => throw _privateConstructorUsedError;
  String? get sunriseValue => throw _privateConstructorUsedError;
  String? get sunsetValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherDetailEntityCopyWith<WeatherDetailEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDetailEntityCopyWith<$Res> {
  factory $WeatherDetailEntityCopyWith(
          WeatherDetailEntity value, $Res Function(WeatherDetailEntity) then) =
      _$WeatherDetailEntityCopyWithImpl<$Res, WeatherDetailEntity>;
  @useResult
  $Res call(
      {String? windValue,
      String? humidityValue,
      String? gustValue,
      String? pressureValue,
      String? sunriseValue,
      String? sunsetValue});
}

/// @nodoc
class _$WeatherDetailEntityCopyWithImpl<$Res, $Val extends WeatherDetailEntity>
    implements $WeatherDetailEntityCopyWith<$Res> {
  _$WeatherDetailEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? windValue = freezed,
    Object? humidityValue = freezed,
    Object? gustValue = freezed,
    Object? pressureValue = freezed,
    Object? sunriseValue = freezed,
    Object? sunsetValue = freezed,
  }) {
    return _then(_value.copyWith(
      windValue: freezed == windValue
          ? _value.windValue
          : windValue // ignore: cast_nullable_to_non_nullable
              as String?,
      humidityValue: freezed == humidityValue
          ? _value.humidityValue
          : humidityValue // ignore: cast_nullable_to_non_nullable
              as String?,
      gustValue: freezed == gustValue
          ? _value.gustValue
          : gustValue // ignore: cast_nullable_to_non_nullable
              as String?,
      pressureValue: freezed == pressureValue
          ? _value.pressureValue
          : pressureValue // ignore: cast_nullable_to_non_nullable
              as String?,
      sunriseValue: freezed == sunriseValue
          ? _value.sunriseValue
          : sunriseValue // ignore: cast_nullable_to_non_nullable
              as String?,
      sunsetValue: freezed == sunsetValue
          ? _value.sunsetValue
          : sunsetValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeatherDetailEntityCopyWith<$Res>
    implements $WeatherDetailEntityCopyWith<$Res> {
  factory _$$_WeatherDetailEntityCopyWith(_$_WeatherDetailEntity value,
          $Res Function(_$_WeatherDetailEntity) then) =
      __$$_WeatherDetailEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? windValue,
      String? humidityValue,
      String? gustValue,
      String? pressureValue,
      String? sunriseValue,
      String? sunsetValue});
}

/// @nodoc
class __$$_WeatherDetailEntityCopyWithImpl<$Res>
    extends _$WeatherDetailEntityCopyWithImpl<$Res, _$_WeatherDetailEntity>
    implements _$$_WeatherDetailEntityCopyWith<$Res> {
  __$$_WeatherDetailEntityCopyWithImpl(_$_WeatherDetailEntity _value,
      $Res Function(_$_WeatherDetailEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? windValue = freezed,
    Object? humidityValue = freezed,
    Object? gustValue = freezed,
    Object? pressureValue = freezed,
    Object? sunriseValue = freezed,
    Object? sunsetValue = freezed,
  }) {
    return _then(_$_WeatherDetailEntity(
      windValue: freezed == windValue
          ? _value.windValue
          : windValue // ignore: cast_nullable_to_non_nullable
              as String?,
      humidityValue: freezed == humidityValue
          ? _value.humidityValue
          : humidityValue // ignore: cast_nullable_to_non_nullable
              as String?,
      gustValue: freezed == gustValue
          ? _value.gustValue
          : gustValue // ignore: cast_nullable_to_non_nullable
              as String?,
      pressureValue: freezed == pressureValue
          ? _value.pressureValue
          : pressureValue // ignore: cast_nullable_to_non_nullable
              as String?,
      sunriseValue: freezed == sunriseValue
          ? _value.sunriseValue
          : sunriseValue // ignore: cast_nullable_to_non_nullable
              as String?,
      sunsetValue: freezed == sunsetValue
          ? _value.sunsetValue
          : sunsetValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_WeatherDetailEntity extends _WeatherDetailEntity {
  const _$_WeatherDetailEntity(
      {required this.windValue,
      required this.humidityValue,
      required this.gustValue,
      required this.pressureValue,
      required this.sunriseValue,
      required this.sunsetValue})
      : super._();

  @override
  final String? windValue;
  @override
  final String? humidityValue;
  @override
  final String? gustValue;
  @override
  final String? pressureValue;
  @override
  final String? sunriseValue;
  @override
  final String? sunsetValue;

  @override
  String toString() {
    return 'WeatherDetailEntity(windValue: $windValue, humidityValue: $humidityValue, gustValue: $gustValue, pressureValue: $pressureValue, sunriseValue: $sunriseValue, sunsetValue: $sunsetValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherDetailEntity &&
            (identical(other.windValue, windValue) ||
                other.windValue == windValue) &&
            (identical(other.humidityValue, humidityValue) ||
                other.humidityValue == humidityValue) &&
            (identical(other.gustValue, gustValue) ||
                other.gustValue == gustValue) &&
            (identical(other.pressureValue, pressureValue) ||
                other.pressureValue == pressureValue) &&
            (identical(other.sunriseValue, sunriseValue) ||
                other.sunriseValue == sunriseValue) &&
            (identical(other.sunsetValue, sunsetValue) ||
                other.sunsetValue == sunsetValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, windValue, humidityValue,
      gustValue, pressureValue, sunriseValue, sunsetValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherDetailEntityCopyWith<_$_WeatherDetailEntity> get copyWith =>
      __$$_WeatherDetailEntityCopyWithImpl<_$_WeatherDetailEntity>(
          this, _$identity);
}

abstract class _WeatherDetailEntity extends WeatherDetailEntity {
  const factory _WeatherDetailEntity(
      {required final String? windValue,
      required final String? humidityValue,
      required final String? gustValue,
      required final String? pressureValue,
      required final String? sunriseValue,
      required final String? sunsetValue}) = _$_WeatherDetailEntity;
  const _WeatherDetailEntity._() : super._();

  @override
  String? get windValue;
  @override
  String? get humidityValue;
  @override
  String? get gustValue;
  @override
  String? get pressureValue;
  @override
  String? get sunriseValue;
  @override
  String? get sunsetValue;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherDetailEntityCopyWith<_$_WeatherDetailEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
