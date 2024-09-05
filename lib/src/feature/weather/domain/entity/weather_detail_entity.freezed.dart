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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeatherDetailEntity {
  String? get windValue => throw _privateConstructorUsedError;
  String? get humidityValue => throw _privateConstructorUsedError;
  String? get gustValue => throw _privateConstructorUsedError;
  String? get pressureValue => throw _privateConstructorUsedError;
  String? get sunriseValue => throw _privateConstructorUsedError;
  String? get sunsetValue => throw _privateConstructorUsedError;
}

/// @nodoc

class _$WeatherDetailEntityImpl extends _WeatherDetailEntity {
  const _$WeatherDetailEntityImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDetailEntityImpl &&
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
}

abstract class _WeatherDetailEntity extends WeatherDetailEntity {
  const factory _WeatherDetailEntity(
      {required final String? windValue,
      required final String? humidityValue,
      required final String? gustValue,
      required final String? pressureValue,
      required final String? sunriseValue,
      required final String? sunsetValue}) = _$WeatherDetailEntityImpl;
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
}
