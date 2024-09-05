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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiRequestState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(AppFailure reason) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(AppFailure reason)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(AppFailure reason)? failed,
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

class _$IDLEImpl<T> implements IDLE<T> {
  const _$IDLEImpl();

  @override
  String toString() {
    return 'ApiRequestState<$T>.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IDLEImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(AppFailure reason) failed,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(AppFailure reason)? failed,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(AppFailure reason)? failed,
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
  const factory IDLE() = _$IDLEImpl<T>;
}

/// @nodoc

class _$LOADINGImpl<T> implements LOADING<T> {
  const _$LOADINGImpl();

  @override
  String toString() {
    return 'ApiRequestState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LOADINGImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(AppFailure reason) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(AppFailure reason)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(AppFailure reason)? failed,
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
  const factory LOADING() = _$LOADINGImpl<T>;
}

/// @nodoc

class _$DATAImpl<T> implements DATA<T> {
  const _$DATAImpl({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'ApiRequestState<$T>.data(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DATAImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(AppFailure reason) failed,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(AppFailure reason)? failed,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(AppFailure reason)? failed,
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
  const factory DATA({required final T data}) = _$DATAImpl<T>;

  T get data;
}

/// @nodoc

class _$FAILEDImpl<T> implements FAILED<T> {
  const _$FAILEDImpl({required this.reason});

  @override
  final AppFailure reason;

  @override
  String toString() {
    return 'ApiRequestState<$T>.failed(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FAILEDImpl<T> &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(AppFailure reason) failed,
  }) {
    return failed(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(AppFailure reason)? failed,
  }) {
    return failed?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(AppFailure reason)? failed,
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
  const factory FAILED({required final AppFailure reason}) = _$FAILEDImpl<T>;

  AppFailure get reason;
}
