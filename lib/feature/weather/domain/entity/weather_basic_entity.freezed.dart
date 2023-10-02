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

  @JsonKey(ignore: true)
  $WeatherBasicEntityCopyWith<WeatherBasicEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherBasicEntityCopyWith<$Res> {
  factory $WeatherBasicEntityCopyWith(
          WeatherBasicEntity value, $Res Function(WeatherBasicEntity) then) =
      _$WeatherBasicEntityCopyWithImpl<$Res, WeatherBasicEntity>;
  @useResult
  $Res call(
      {String? cityName,
      String? temp,
      String? condition,
      String? dateTime,
      String? imgUrl,
      String? feelsLike,
      String? description});
}

/// @nodoc
class _$WeatherBasicEntityCopyWithImpl<$Res, $Val extends WeatherBasicEntity>
    implements $WeatherBasicEntityCopyWith<$Res> {
  _$WeatherBasicEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = freezed,
    Object? temp = freezed,
    Object? condition = freezed,
    Object? dateTime = freezed,
    Object? imgUrl = freezed,
    Object? feelsLike = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as String?,
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      feelsLike: freezed == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeatherBasicEntityCopyWith<$Res>
    implements $WeatherBasicEntityCopyWith<$Res> {
  factory _$$_WeatherBasicEntityCopyWith(_$_WeatherBasicEntity value,
          $Res Function(_$_WeatherBasicEntity) then) =
      __$$_WeatherBasicEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? cityName,
      String? temp,
      String? condition,
      String? dateTime,
      String? imgUrl,
      String? feelsLike,
      String? description});
}

/// @nodoc
class __$$_WeatherBasicEntityCopyWithImpl<$Res>
    extends _$WeatherBasicEntityCopyWithImpl<$Res, _$_WeatherBasicEntity>
    implements _$$_WeatherBasicEntityCopyWith<$Res> {
  __$$_WeatherBasicEntityCopyWithImpl(
      _$_WeatherBasicEntity _value, $Res Function(_$_WeatherBasicEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = freezed,
    Object? temp = freezed,
    Object? condition = freezed,
    Object? dateTime = freezed,
    Object? imgUrl = freezed,
    Object? feelsLike = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_WeatherBasicEntity(
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as String?,
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      feelsLike: freezed == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherBasicEntityCopyWith<_$_WeatherBasicEntity> get copyWith =>
      __$$_WeatherBasicEntityCopyWithImpl<_$_WeatherBasicEntity>(
          this, _$identity);
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
  @override
  @JsonKey(ignore: true)
  _$$_WeatherBasicEntityCopyWith<_$_WeatherBasicEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
