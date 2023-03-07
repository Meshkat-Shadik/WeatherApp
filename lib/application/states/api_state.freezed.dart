// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiRequestState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(String reason) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(String reason)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String reason)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IDLE<T> value) idle,
    required TResult Function(LOADING<T> value) loading,
    required TResult Function(DATA<T> value) data,
    required TResult Function(FAILED<T> value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IDLE<T> value)? idle,
    TResult? Function(LOADING<T> value)? loading,
    TResult? Function(DATA<T> value)? data,
    TResult? Function(FAILED<T> value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IDLE<T> value)? idle,
    TResult Function(LOADING<T> value)? loading,
    TResult Function(DATA<T> value)? data,
    TResult Function(FAILED<T> value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiRequestStateCopyWith<T, $Res> {
  factory $ApiRequestStateCopyWith(
          ApiRequestState<T> value, $Res Function(ApiRequestState<T>) then) =
      _$ApiRequestStateCopyWithImpl<T, $Res, ApiRequestState<T>>;
}

/// @nodoc
class _$ApiRequestStateCopyWithImpl<T, $Res, $Val extends ApiRequestState<T>>
    implements $ApiRequestStateCopyWith<T, $Res> {
  _$ApiRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IDLECopyWith<T, $Res> {
  factory _$$IDLECopyWith(_$IDLE<T> value, $Res Function(_$IDLE<T>) then) =
      __$$IDLECopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$IDLECopyWithImpl<T, $Res>
    extends _$ApiRequestStateCopyWithImpl<T, $Res, _$IDLE<T>>
    implements _$$IDLECopyWith<T, $Res> {
  __$$IDLECopyWithImpl(_$IDLE<T> _value, $Res Function(_$IDLE<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IDLE<T> implements IDLE<T> {
  const _$IDLE();

  @override
  String toString() {
    return 'ApiRequestState<$T>.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IDLE<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(String reason) failed,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(String reason)? failed,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String reason)? failed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IDLE<T> value) idle,
    required TResult Function(LOADING<T> value) loading,
    required TResult Function(DATA<T> value) data,
    required TResult Function(FAILED<T> value) failed,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IDLE<T> value)? idle,
    TResult? Function(LOADING<T> value)? loading,
    TResult? Function(DATA<T> value)? data,
    TResult? Function(FAILED<T> value)? failed,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IDLE<T> value)? idle,
    TResult Function(LOADING<T> value)? loading,
    TResult Function(DATA<T> value)? data,
    TResult Function(FAILED<T> value)? failed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class IDLE<T> implements ApiRequestState<T> {
  const factory IDLE() = _$IDLE<T>;
}

/// @nodoc
abstract class _$$LOADINGCopyWith<T, $Res> {
  factory _$$LOADINGCopyWith(
          _$LOADING<T> value, $Res Function(_$LOADING<T>) then) =
      __$$LOADINGCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LOADINGCopyWithImpl<T, $Res>
    extends _$ApiRequestStateCopyWithImpl<T, $Res, _$LOADING<T>>
    implements _$$LOADINGCopyWith<T, $Res> {
  __$$LOADINGCopyWithImpl(
      _$LOADING<T> _value, $Res Function(_$LOADING<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LOADING<T> implements LOADING<T> {
  const _$LOADING();

  @override
  String toString() {
    return 'ApiRequestState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LOADING<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(String reason) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(String reason)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String reason)? failed,
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
    required TResult Function(IDLE<T> value) idle,
    required TResult Function(LOADING<T> value) loading,
    required TResult Function(DATA<T> value) data,
    required TResult Function(FAILED<T> value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IDLE<T> value)? idle,
    TResult? Function(LOADING<T> value)? loading,
    TResult? Function(DATA<T> value)? data,
    TResult? Function(FAILED<T> value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IDLE<T> value)? idle,
    TResult Function(LOADING<T> value)? loading,
    TResult Function(DATA<T> value)? data,
    TResult Function(FAILED<T> value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LOADING<T> implements ApiRequestState<T> {
  const factory LOADING() = _$LOADING<T>;
}

/// @nodoc
abstract class _$$DATACopyWith<T, $Res> {
  factory _$$DATACopyWith(_$DATA<T> value, $Res Function(_$DATA<T>) then) =
      __$$DATACopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$DATACopyWithImpl<T, $Res>
    extends _$ApiRequestStateCopyWithImpl<T, $Res, _$DATA<T>>
    implements _$$DATACopyWith<T, $Res> {
  __$$DATACopyWithImpl(_$DATA<T> _value, $Res Function(_$DATA<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$DATA<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$DATA<T> implements DATA<T> {
  const _$DATA({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'ApiRequestState<$T>.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DATA<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DATACopyWith<T, _$DATA<T>> get copyWith =>
      __$$DATACopyWithImpl<T, _$DATA<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(String reason) failed,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(String reason)? failed,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String reason)? failed,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IDLE<T> value) idle,
    required TResult Function(LOADING<T> value) loading,
    required TResult Function(DATA<T> value) data,
    required TResult Function(FAILED<T> value) failed,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IDLE<T> value)? idle,
    TResult? Function(LOADING<T> value)? loading,
    TResult? Function(DATA<T> value)? data,
    TResult? Function(FAILED<T> value)? failed,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IDLE<T> value)? idle,
    TResult Function(LOADING<T> value)? loading,
    TResult Function(DATA<T> value)? data,
    TResult Function(FAILED<T> value)? failed,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class DATA<T> implements ApiRequestState<T> {
  const factory DATA({required final T data}) = _$DATA<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$DATACopyWith<T, _$DATA<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FAILEDCopyWith<T, $Res> {
  factory _$$FAILEDCopyWith(
          _$FAILED<T> value, $Res Function(_$FAILED<T>) then) =
      __$$FAILEDCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class __$$FAILEDCopyWithImpl<T, $Res>
    extends _$ApiRequestStateCopyWithImpl<T, $Res, _$FAILED<T>>
    implements _$$FAILEDCopyWith<T, $Res> {
  __$$FAILEDCopyWithImpl(_$FAILED<T> _value, $Res Function(_$FAILED<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
  }) {
    return _then(_$FAILED<T>(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FAILED<T> implements FAILED<T> {
  const _$FAILED({required this.reason});

  @override
  final String reason;

  @override
  String toString() {
    return 'ApiRequestState<$T>.failed(reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FAILED<T> &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FAILEDCopyWith<T, _$FAILED<T>> get copyWith =>
      __$$FAILEDCopyWithImpl<T, _$FAILED<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(String reason) failed,
  }) {
    return failed(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(String reason)? failed,
  }) {
    return failed?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String reason)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IDLE<T> value) idle,
    required TResult Function(LOADING<T> value) loading,
    required TResult Function(DATA<T> value) data,
    required TResult Function(FAILED<T> value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IDLE<T> value)? idle,
    TResult? Function(LOADING<T> value)? loading,
    TResult? Function(DATA<T> value)? data,
    TResult? Function(FAILED<T> value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IDLE<T> value)? idle,
    TResult Function(LOADING<T> value)? loading,
    TResult Function(DATA<T> value)? data,
    TResult Function(FAILED<T> value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class FAILED<T> implements ApiRequestState<T> {
  const factory FAILED({required final String reason}) = _$FAILED<T>;

  String get reason;
  @JsonKey(ignore: true)
  _$$FAILEDCopyWith<T, _$FAILED<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
