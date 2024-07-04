// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppFailure {
  String get message => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get uriPath => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
}

/// @nodoc

class _$_AppFailure extends _AppFailure {
  const _$_AppFailure(
      {required this.message,
      required this.name,
      this.uriPath,
      this.statusCode})
      : super._();

  @override
  final String message;
  @override
  final String name;
  @override
  final String? uriPath;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'AppFailure(message: $message, name: $name, uriPath: $uriPath, statusCode: $statusCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppFailure &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uriPath, uriPath) || other.uriPath == uriPath) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, name, uriPath, statusCode);
}

abstract class _AppFailure extends AppFailure {
  const factory _AppFailure(
      {required final String message,
      required final String name,
      final String? uriPath,
      final int? statusCode}) = _$_AppFailure;
  const _AppFailure._() : super._();

  @override
  String get message;
  @override
  String get name;
  @override
  String? get uriPath;
  @override
  int? get statusCode;
}
