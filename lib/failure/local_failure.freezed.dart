// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocalFailure {
  String get name => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get uriPath => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
}

/// @nodoc

class _$_LocalFailure implements _LocalFailure {
  const _$_LocalFailure(
      {required this.name,
      required this.message,
      this.uriPath,
      this.statusCode});

  @override
  final String name;
  @override
  final String message;
  @override
  final String? uriPath;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'LocalFailure(name: $name, message: $message, uriPath: $uriPath, statusCode: $statusCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalFailure &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.uriPath, uriPath) || other.uriPath == uriPath) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, message, uriPath, statusCode);
}

abstract class _LocalFailure implements LocalFailure {
  const factory _LocalFailure(
      {required final String name,
      required final String message,
      final String? uriPath,
      final int? statusCode}) = _$_LocalFailure;

  @override
  String get name;
  @override
  String get message;
  @override
  String? get uriPath;
  @override
  int? get statusCode;
}