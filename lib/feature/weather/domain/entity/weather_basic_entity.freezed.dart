// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_basic_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherBasicEntity {
  String? get cityName => throw _privateConstructorUsedError;
  String? get temp => throw _privateConstructorUsedError;
  String? get condition => throw _privateConstructorUsedError;
  String? get dateTime => throw _privateConstructorUsedError;
  String? get imgUrl => throw _privateConstructorUsedError;
  String? get feelsLike => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
}

/// @nodoc

class _$_WeatherBasicEntity extends _WeatherBasicEntity {
  const _$_WeatherBasicEntity(
      {required this.cityName,
      required this.temp,
      required this.condition,
      required this.dateTime,
      required this.imgUrl,
      required this.feelsLike,
      required this.description})
      : super._();

  @override
  final String? cityName;
  @override
  final String? temp;
  @override
  final String? condition;
  @override
  final String? dateTime;
  @override
  final String? imgUrl;
  @override
  final String? feelsLike;
  @override
  final String? description;

  @override
  String toString() {
    return 'WeatherBasicEntity(cityName: $cityName, temp: $temp, condition: $condition, dateTime: $dateTime, imgUrl: $imgUrl, feelsLike: $feelsLike, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherBasicEntity &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.feelsLike, feelsLike) ||
                other.feelsLike == feelsLike) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cityName, temp, condition,
      dateTime, imgUrl, feelsLike, description);
}

abstract class _WeatherBasicEntity extends WeatherBasicEntity {
  const factory _WeatherBasicEntity(
      {required final String? cityName,
      required final String? temp,
      required final String? condition,
      required final String? dateTime,
      required final String? imgUrl,
      required final String? feelsLike,
      required final String? description}) = _$_WeatherBasicEntity;
  const _WeatherBasicEntity._() : super._();

  @override
  String? get cityName;
  @override
  String? get temp;
  @override
  String? get condition;
  @override
  String? get dateTime;
  @override
  String? get imgUrl;
  @override
  String? get feelsLike;
  @override
  String? get description;
}
