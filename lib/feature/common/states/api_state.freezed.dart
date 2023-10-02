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
mixin _$ApiRequestState<T, E> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(E reason) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(E reason)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(E reason)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IDLE<T, E> value) idle,
    required TResult Function(LOADING<T, E> value) loading,
    required TResult Function(DATA<T, E> value) data,
    required TResult Function(FAILED<T, E> value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IDLE<T, E> value)? idle,
    TResult? Function(LOADING<T, E> value)? loading,
    TResult? Function(DATA<T, E> value)? data,
    TResult? Function(FAILED<T, E> value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IDLE<T, E> value)? idle,
    TResult Function(LOADING<T, E> value)? loading,
    TResult Function(DATA<T, E> value)? data,
    TResult Function(FAILED<T, E> value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiRequestStateCopyWith<T, E, $Res> {
  factory $ApiRequestStateCopyWith(ApiRequestState<T, E> value,
          $Res Function(ApiRequestState<T, E>) then) =
      _$ApiRequestStateCopyWithImpl<T, E, $Res, ApiRequestState<T, E>>;
}

/// @nodoc
class _$ApiRequestStateCopyWithImpl<T, E, $Res,
        $Val extends ApiRequestState<T, E>>
    implements $ApiRequestStateCopyWith<T, E, $Res> {
  _$ApiRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IDLECopyWith<T, E, $Res> {
  factory _$$IDLECopyWith(
          _$IDLE<T, E> value, $Res Function(_$IDLE<T, E>) then) =
      __$$IDLECopyWithImpl<T, E, $Res>;
}

/// @nodoc
class __$$IDLECopyWithImpl<T, E, $Res>
    extends _$ApiRequestStateCopyWithImpl<T, E, $Res, _$IDLE<T, E>>
    implements _$$IDLECopyWith<T, E, $Res> {
  __$$IDLECopyWithImpl(_$IDLE<T, E> _value, $Res Function(_$IDLE<T, E>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IDLE<T, E> implements IDLE<T, E> {
  const _$IDLE();

  @override
  String toString() {
    return 'ApiRequestState<$T, $E>.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IDLE<T, E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(E reason) failed,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(E reason)? failed,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(E reason)? failed,
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
    required TResult Function(IDLE<T, E> value) idle,
    required TResult Function(LOADING<T, E> value) loading,
    required TResult Function(DATA<T, E> value) data,
    required TResult Function(FAILED<T, E> value) failed,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IDLE<T, E> value)? idle,
    TResult? Function(LOADING<T, E> value)? loading,
    TResult? Function(DATA<T, E> value)? data,
    TResult? Function(FAILED<T, E> value)? failed,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IDLE<T, E> value)? idle,
    TResult Function(LOADING<T, E> value)? loading,
    TResult Function(DATA<T, E> value)? data,
    TResult Function(FAILED<T, E> value)? failed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class IDLE<T, E> implements ApiRequestState<T, E> {
  const factory IDLE() = _$IDLE<T, E>;
}

/// @nodoc
abstract class _$$LOADINGCopyWith<T, E, $Res> {
  factory _$$LOADINGCopyWith(
          _$LOADING<T, E> value, $Res Function(_$LOADING<T, E>) then) =
      __$$LOADINGCopyWithImpl<T, E, $Res>;
}

/// @nodoc
class __$$LOADINGCopyWithImpl<T, E, $Res>
    extends _$ApiRequestStateCopyWithImpl<T, E, $Res, _$LOADING<T, E>>
    implements _$$LOADINGCopyWith<T, E, $Res> {
  __$$LOADINGCopyWithImpl(
      _$LOADING<T, E> _value, $Res Function(_$LOADING<T, E>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LOADING<T, E> implements LOADING<T, E> {
  const _$LOADING();

  @override
  String toString() {
    return 'ApiRequestState<$T, $E>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LOADING<T, E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(E reason) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(E reason)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(E reason)? failed,
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
    required TResult Function(IDLE<T, E> value) idle,
    required TResult Function(LOADING<T, E> value) loading,
    required TResult Function(DATA<T, E> value) data,
    required TResult Function(FAILED<T, E> value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IDLE<T, E> value)? idle,
    TResult? Function(LOADING<T, E> value)? loading,
    TResult? Function(DATA<T, E> value)? data,
    TResult? Function(FAILED<T, E> value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IDLE<T, E> value)? idle,
    TResult Function(LOADING<T, E> value)? loading,
    TResult Function(DATA<T, E> value)? data,
    TResult Function(FAILED<T, E> value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LOADING<T, E> implements ApiRequestState<T, E> {
  const factory LOADING() = _$LOADING<T, E>;
}

/// @nodoc
abstract class _$$DATACopyWith<T, E, $Res> {
  factory _$$DATACopyWith(
          _$DATA<T, E> value, $Res Function(_$DATA<T, E>) then) =
      __$$DATACopyWithImpl<T, E, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$DATACopyWithImpl<T, E, $Res>
    extends _$ApiRequestStateCopyWithImpl<T, E, $Res, _$DATA<T, E>>
    implements _$$DATACopyWith<T, E, $Res> {
  __$$DATACopyWithImpl(_$DATA<T, E> _value, $Res Function(_$DATA<T, E>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$DATA<T, E>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$DATA<T, E> implements DATA<T, E> {
  const _$DATA({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'ApiRequestState<$T, $E>.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DATA<T, E> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DATACopyWith<T, E, _$DATA<T, E>> get copyWith =>
      __$$DATACopyWithImpl<T, E, _$DATA<T, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(E reason) failed,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(E reason)? failed,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(E reason)? failed,
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
    required TResult Function(IDLE<T, E> value) idle,
    required TResult Function(LOADING<T, E> value) loading,
    required TResult Function(DATA<T, E> value) data,
    required TResult Function(FAILED<T, E> value) failed,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IDLE<T, E> value)? idle,
    TResult? Function(LOADING<T, E> value)? loading,
    TResult? Function(DATA<T, E> value)? data,
    TResult? Function(FAILED<T, E> value)? failed,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IDLE<T, E> value)? idle,
    TResult Function(LOADING<T, E> value)? loading,
    TResult Function(DATA<T, E> value)? data,
    TResult Function(FAILED<T, E> value)? failed,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class DATA<T, E> implements ApiRequestState<T, E> {
  const factory DATA({required final T data}) = _$DATA<T, E>;

  T get data;
  @JsonKey(ignore: true)
  _$$DATACopyWith<T, E, _$DATA<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FAILEDCopyWith<T, E, $Res> {
  factory _$$FAILEDCopyWith(
          _$FAILED<T, E> value, $Res Function(_$FAILED<T, E>) then) =
      __$$FAILEDCopyWithImpl<T, E, $Res>;
  @useResult
  $Res call({E reason});
}

/// @nodoc
class __$$FAILEDCopyWithImpl<T, E, $Res>
    extends _$ApiRequestStateCopyWithImpl<T, E, $Res, _$FAILED<T, E>>
    implements _$$FAILEDCopyWith<T, E, $Res> {
  __$$FAILEDCopyWithImpl(
      _$FAILED<T, E> _value, $Res Function(_$FAILED<T, E>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = freezed,
  }) {
    return _then(_$FAILED<T, E>(
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc

class _$FAILED<T, E> implements FAILED<T, E> {
  const _$FAILED({required this.reason});

  @override
  final E reason;

  @override
  String toString() {
    return 'ApiRequestState<$T, $E>.failed(reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FAILED<T, E> &&
            const DeepCollectionEquality().equals(other.reason, reason));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(reason));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FAILEDCopyWith<T, E, _$FAILED<T, E>> get copyWith =>
      __$$FAILEDCopyWithImpl<T, E, _$FAILED<T, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(E reason) failed,
  }) {
    return failed(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(E reason)? failed,
  }) {
    return failed?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(E reason)? failed,
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
    required TResult Function(IDLE<T, E> value) idle,
    required TResult Function(LOADING<T, E> value) loading,
    required TResult Function(DATA<T, E> value) data,
    required TResult Function(FAILED<T, E> value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IDLE<T, E> value)? idle,
    TResult? Function(LOADING<T, E> value)? loading,
    TResult? Function(DATA<T, E> value)? data,
    TResult? Function(FAILED<T, E> value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IDLE<T, E> value)? idle,
    TResult Function(LOADING<T, E> value)? loading,
    TResult Function(DATA<T, E> value)? data,
    TResult Function(FAILED<T, E> value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class FAILED<T, E> implements ApiRequestState<T, E> {
  const factory FAILED({required final E reason}) = _$FAILED<T, E>;

  E get reason;
  @JsonKey(ignore: true)
  _$$FAILEDCopyWith<T, E, _$FAILED<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}
