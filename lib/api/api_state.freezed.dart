// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'api_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WeatherDataStateTearOff {
  const _$WeatherDataStateTearOff();

  _WeatherInitial initial() {
    return const _WeatherInitial();
  }

  _WeatherLoading loading() {
    return const _WeatherLoading();
  }

  _WeatherLoadedSuccess success(WeatherData weatherData) {
    return _WeatherLoadedSuccess(
      weatherData,
    );
  }

  _WeatherLoadedError error([String? message]) {
    return _WeatherLoadedError(
      message,
    );
  }
}

/// @nodoc
const $WeatherDataState = _$WeatherDataStateTearOff();

/// @nodoc
mixin _$WeatherDataState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(WeatherData weatherData) success,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(WeatherData weatherData)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeatherInitial value) initial,
    required TResult Function(_WeatherLoading value) loading,
    required TResult Function(_WeatherLoadedSuccess value) success,
    required TResult Function(_WeatherLoadedError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeatherInitial value)? initial,
    TResult Function(_WeatherLoading value)? loading,
    TResult Function(_WeatherLoadedSuccess value)? success,
    TResult Function(_WeatherLoadedError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDataStateCopyWith<$Res> {
  factory $WeatherDataStateCopyWith(
          WeatherDataState value, $Res Function(WeatherDataState) then) =
      _$WeatherDataStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$WeatherDataStateCopyWithImpl<$Res>
    implements $WeatherDataStateCopyWith<$Res> {
  _$WeatherDataStateCopyWithImpl(this._value, this._then);

  final WeatherDataState _value;
  // ignore: unused_field
  final $Res Function(WeatherDataState) _then;
}

/// @nodoc
abstract class _$WeatherInitialCopyWith<$Res> {
  factory _$WeatherInitialCopyWith(
          _WeatherInitial value, $Res Function(_WeatherInitial) then) =
      __$WeatherInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$WeatherInitialCopyWithImpl<$Res>
    extends _$WeatherDataStateCopyWithImpl<$Res>
    implements _$WeatherInitialCopyWith<$Res> {
  __$WeatherInitialCopyWithImpl(
      _WeatherInitial _value, $Res Function(_WeatherInitial) _then)
      : super(_value, (v) => _then(v as _WeatherInitial));

  @override
  _WeatherInitial get _value => super._value as _WeatherInitial;
}

/// @nodoc

class _$_WeatherInitial implements _WeatherInitial {
  const _$_WeatherInitial();

  @override
  String toString() {
    return 'WeatherDataState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _WeatherInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(WeatherData weatherData) success,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(WeatherData weatherData)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeatherInitial value) initial,
    required TResult Function(_WeatherLoading value) loading,
    required TResult Function(_WeatherLoadedSuccess value) success,
    required TResult Function(_WeatherLoadedError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeatherInitial value)? initial,
    TResult Function(_WeatherLoading value)? loading,
    TResult Function(_WeatherLoadedSuccess value)? success,
    TResult Function(_WeatherLoadedError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _WeatherInitial implements WeatherDataState {
  const factory _WeatherInitial() = _$_WeatherInitial;
}

/// @nodoc
abstract class _$WeatherLoadingCopyWith<$Res> {
  factory _$WeatherLoadingCopyWith(
          _WeatherLoading value, $Res Function(_WeatherLoading) then) =
      __$WeatherLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$WeatherLoadingCopyWithImpl<$Res>
    extends _$WeatherDataStateCopyWithImpl<$Res>
    implements _$WeatherLoadingCopyWith<$Res> {
  __$WeatherLoadingCopyWithImpl(
      _WeatherLoading _value, $Res Function(_WeatherLoading) _then)
      : super(_value, (v) => _then(v as _WeatherLoading));

  @override
  _WeatherLoading get _value => super._value as _WeatherLoading;
}

/// @nodoc

class _$_WeatherLoading implements _WeatherLoading {
  const _$_WeatherLoading();

  @override
  String toString() {
    return 'WeatherDataState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _WeatherLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(WeatherData weatherData) success,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(WeatherData weatherData)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeatherInitial value) initial,
    required TResult Function(_WeatherLoading value) loading,
    required TResult Function(_WeatherLoadedSuccess value) success,
    required TResult Function(_WeatherLoadedError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeatherInitial value)? initial,
    TResult Function(_WeatherLoading value)? loading,
    TResult Function(_WeatherLoadedSuccess value)? success,
    TResult Function(_WeatherLoadedError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _WeatherLoading implements WeatherDataState {
  const factory _WeatherLoading() = _$_WeatherLoading;
}

/// @nodoc
abstract class _$WeatherLoadedSuccessCopyWith<$Res> {
  factory _$WeatherLoadedSuccessCopyWith(_WeatherLoadedSuccess value,
          $Res Function(_WeatherLoadedSuccess) then) =
      __$WeatherLoadedSuccessCopyWithImpl<$Res>;
  $Res call({WeatherData weatherData});

  $WeatherDataCopyWith<$Res> get weatherData;
}

/// @nodoc
class __$WeatherLoadedSuccessCopyWithImpl<$Res>
    extends _$WeatherDataStateCopyWithImpl<$Res>
    implements _$WeatherLoadedSuccessCopyWith<$Res> {
  __$WeatherLoadedSuccessCopyWithImpl(
      _WeatherLoadedSuccess _value, $Res Function(_WeatherLoadedSuccess) _then)
      : super(_value, (v) => _then(v as _WeatherLoadedSuccess));

  @override
  _WeatherLoadedSuccess get _value => super._value as _WeatherLoadedSuccess;

  @override
  $Res call({
    Object? weatherData = freezed,
  }) {
    return _then(_WeatherLoadedSuccess(
      weatherData == freezed
          ? _value.weatherData
          : weatherData // ignore: cast_nullable_to_non_nullable
              as WeatherData,
    ));
  }

  @override
  $WeatherDataCopyWith<$Res> get weatherData {
    return $WeatherDataCopyWith<$Res>(_value.weatherData, (value) {
      return _then(_value.copyWith(weatherData: value));
    });
  }
}

/// @nodoc

class _$_WeatherLoadedSuccess implements _WeatherLoadedSuccess {
  const _$_WeatherLoadedSuccess(this.weatherData);

  @override
  final WeatherData weatherData;

  @override
  String toString() {
    return 'WeatherDataState.success(weatherData: $weatherData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WeatherLoadedSuccess &&
            (identical(other.weatherData, weatherData) ||
                const DeepCollectionEquality()
                    .equals(other.weatherData, weatherData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(weatherData);

  @JsonKey(ignore: true)
  @override
  _$WeatherLoadedSuccessCopyWith<_WeatherLoadedSuccess> get copyWith =>
      __$WeatherLoadedSuccessCopyWithImpl<_WeatherLoadedSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(WeatherData weatherData) success,
    required TResult Function(String? message) error,
  }) {
    return success(weatherData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(WeatherData weatherData)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(weatherData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeatherInitial value) initial,
    required TResult Function(_WeatherLoading value) loading,
    required TResult Function(_WeatherLoadedSuccess value) success,
    required TResult Function(_WeatherLoadedError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeatherInitial value)? initial,
    TResult Function(_WeatherLoading value)? loading,
    TResult Function(_WeatherLoadedSuccess value)? success,
    TResult Function(_WeatherLoadedError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _WeatherLoadedSuccess implements WeatherDataState {
  const factory _WeatherLoadedSuccess(WeatherData weatherData) =
      _$_WeatherLoadedSuccess;

  WeatherData get weatherData => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$WeatherLoadedSuccessCopyWith<_WeatherLoadedSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$WeatherLoadedErrorCopyWith<$Res> {
  factory _$WeatherLoadedErrorCopyWith(
          _WeatherLoadedError value, $Res Function(_WeatherLoadedError) then) =
      __$WeatherLoadedErrorCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$WeatherLoadedErrorCopyWithImpl<$Res>
    extends _$WeatherDataStateCopyWithImpl<$Res>
    implements _$WeatherLoadedErrorCopyWith<$Res> {
  __$WeatherLoadedErrorCopyWithImpl(
      _WeatherLoadedError _value, $Res Function(_WeatherLoadedError) _then)
      : super(_value, (v) => _then(v as _WeatherLoadedError));

  @override
  _WeatherLoadedError get _value => super._value as _WeatherLoadedError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_WeatherLoadedError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_WeatherLoadedError implements _WeatherLoadedError {
  const _$_WeatherLoadedError([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'WeatherDataState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WeatherLoadedError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$WeatherLoadedErrorCopyWith<_WeatherLoadedError> get copyWith =>
      __$WeatherLoadedErrorCopyWithImpl<_WeatherLoadedError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(WeatherData weatherData) success,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(WeatherData weatherData)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeatherInitial value) initial,
    required TResult Function(_WeatherLoading value) loading,
    required TResult Function(_WeatherLoadedSuccess value) success,
    required TResult Function(_WeatherLoadedError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeatherInitial value)? initial,
    TResult Function(_WeatherLoading value)? loading,
    TResult Function(_WeatherLoadedSuccess value)? success,
    TResult Function(_WeatherLoadedError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _WeatherLoadedError implements WeatherDataState {
  const factory _WeatherLoadedError([String? message]) = _$_WeatherLoadedError;

  String? get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$WeatherLoadedErrorCopyWith<_WeatherLoadedError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$LocationDataStateTearOff {
  const _$LocationDataStateTearOff();

  _LocationInitial initial() {
    return const _LocationInitial();
  }

  _LocationLoading loading() {
    return const _LocationLoading();
  }

  _LocationSuccess success(String address) {
    return _LocationSuccess(
      address,
    );
  }

  _LocationLoadedError error([String? message]) {
    return _LocationLoadedError(
      message,
    );
  }
}

/// @nodoc
const $LocationDataState = _$LocationDataStateTearOff();

/// @nodoc
mixin _$LocationDataState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String address) success,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String address)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocationInitial value) initial,
    required TResult Function(_LocationLoading value) loading,
    required TResult Function(_LocationSuccess value) success,
    required TResult Function(_LocationLoadedError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocationInitial value)? initial,
    TResult Function(_LocationLoading value)? loading,
    TResult Function(_LocationSuccess value)? success,
    TResult Function(_LocationLoadedError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDataStateCopyWith<$Res> {
  factory $LocationDataStateCopyWith(
          LocationDataState value, $Res Function(LocationDataState) then) =
      _$LocationDataStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocationDataStateCopyWithImpl<$Res>
    implements $LocationDataStateCopyWith<$Res> {
  _$LocationDataStateCopyWithImpl(this._value, this._then);

  final LocationDataState _value;
  // ignore: unused_field
  final $Res Function(LocationDataState) _then;
}

/// @nodoc
abstract class _$LocationInitialCopyWith<$Res> {
  factory _$LocationInitialCopyWith(
          _LocationInitial value, $Res Function(_LocationInitial) then) =
      __$LocationInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$LocationInitialCopyWithImpl<$Res>
    extends _$LocationDataStateCopyWithImpl<$Res>
    implements _$LocationInitialCopyWith<$Res> {
  __$LocationInitialCopyWithImpl(
      _LocationInitial _value, $Res Function(_LocationInitial) _then)
      : super(_value, (v) => _then(v as _LocationInitial));

  @override
  _LocationInitial get _value => super._value as _LocationInitial;
}

/// @nodoc

class _$_LocationInitial implements _LocationInitial {
  const _$_LocationInitial();

  @override
  String toString() {
    return 'LocationDataState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LocationInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String address) success,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String address)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocationInitial value) initial,
    required TResult Function(_LocationLoading value) loading,
    required TResult Function(_LocationSuccess value) success,
    required TResult Function(_LocationLoadedError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocationInitial value)? initial,
    TResult Function(_LocationLoading value)? loading,
    TResult Function(_LocationSuccess value)? success,
    TResult Function(_LocationLoadedError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _LocationInitial implements LocationDataState {
  const factory _LocationInitial() = _$_LocationInitial;
}

/// @nodoc
abstract class _$LocationLoadingCopyWith<$Res> {
  factory _$LocationLoadingCopyWith(
          _LocationLoading value, $Res Function(_LocationLoading) then) =
      __$LocationLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LocationLoadingCopyWithImpl<$Res>
    extends _$LocationDataStateCopyWithImpl<$Res>
    implements _$LocationLoadingCopyWith<$Res> {
  __$LocationLoadingCopyWithImpl(
      _LocationLoading _value, $Res Function(_LocationLoading) _then)
      : super(_value, (v) => _then(v as _LocationLoading));

  @override
  _LocationLoading get _value => super._value as _LocationLoading;
}

/// @nodoc

class _$_LocationLoading implements _LocationLoading {
  const _$_LocationLoading();

  @override
  String toString() {
    return 'LocationDataState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LocationLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String address) success,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String address)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocationInitial value) initial,
    required TResult Function(_LocationLoading value) loading,
    required TResult Function(_LocationSuccess value) success,
    required TResult Function(_LocationLoadedError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocationInitial value)? initial,
    TResult Function(_LocationLoading value)? loading,
    TResult Function(_LocationSuccess value)? success,
    TResult Function(_LocationLoadedError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LocationLoading implements LocationDataState {
  const factory _LocationLoading() = _$_LocationLoading;
}

/// @nodoc
abstract class _$LocationSuccessCopyWith<$Res> {
  factory _$LocationSuccessCopyWith(
          _LocationSuccess value, $Res Function(_LocationSuccess) then) =
      __$LocationSuccessCopyWithImpl<$Res>;
  $Res call({String address});
}

/// @nodoc
class __$LocationSuccessCopyWithImpl<$Res>
    extends _$LocationDataStateCopyWithImpl<$Res>
    implements _$LocationSuccessCopyWith<$Res> {
  __$LocationSuccessCopyWithImpl(
      _LocationSuccess _value, $Res Function(_LocationSuccess) _then)
      : super(_value, (v) => _then(v as _LocationSuccess));

  @override
  _LocationSuccess get _value => super._value as _LocationSuccess;

  @override
  $Res call({
    Object? address = freezed,
  }) {
    return _then(_LocationSuccess(
      address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LocationSuccess implements _LocationSuccess {
  const _$_LocationSuccess(this.address);

  @override
  final String address;

  @override
  String toString() {
    return 'LocationDataState.success(address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocationSuccess &&
            (identical(other.address, address) ||
                const DeepCollectionEquality().equals(other.address, address)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(address);

  @JsonKey(ignore: true)
  @override
  _$LocationSuccessCopyWith<_LocationSuccess> get copyWith =>
      __$LocationSuccessCopyWithImpl<_LocationSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String address) success,
    required TResult Function(String? message) error,
  }) {
    return success(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String address)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocationInitial value) initial,
    required TResult Function(_LocationLoading value) loading,
    required TResult Function(_LocationSuccess value) success,
    required TResult Function(_LocationLoadedError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocationInitial value)? initial,
    TResult Function(_LocationLoading value)? loading,
    TResult Function(_LocationSuccess value)? success,
    TResult Function(_LocationLoadedError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _LocationSuccess implements LocationDataState {
  const factory _LocationSuccess(String address) = _$_LocationSuccess;

  String get address => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LocationSuccessCopyWith<_LocationSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LocationLoadedErrorCopyWith<$Res> {
  factory _$LocationLoadedErrorCopyWith(_LocationLoadedError value,
          $Res Function(_LocationLoadedError) then) =
      __$LocationLoadedErrorCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$LocationLoadedErrorCopyWithImpl<$Res>
    extends _$LocationDataStateCopyWithImpl<$Res>
    implements _$LocationLoadedErrorCopyWith<$Res> {
  __$LocationLoadedErrorCopyWithImpl(
      _LocationLoadedError _value, $Res Function(_LocationLoadedError) _then)
      : super(_value, (v) => _then(v as _LocationLoadedError));

  @override
  _LocationLoadedError get _value => super._value as _LocationLoadedError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_LocationLoadedError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LocationLoadedError implements _LocationLoadedError {
  const _$_LocationLoadedError([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'LocationDataState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocationLoadedError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$LocationLoadedErrorCopyWith<_LocationLoadedError> get copyWith =>
      __$LocationLoadedErrorCopyWithImpl<_LocationLoadedError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String address) success,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String address)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocationInitial value) initial,
    required TResult Function(_LocationLoading value) loading,
    required TResult Function(_LocationSuccess value) success,
    required TResult Function(_LocationLoadedError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocationInitial value)? initial,
    TResult Function(_LocationLoading value)? loading,
    TResult Function(_LocationSuccess value)? success,
    TResult Function(_LocationLoadedError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _LocationLoadedError implements LocationDataState {
  const factory _LocationLoadedError([String? message]) =
      _$_LocationLoadedError;

  String? get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LocationLoadedErrorCopyWith<_LocationLoadedError> get copyWith =>
      throw _privateConstructorUsedError;
}
