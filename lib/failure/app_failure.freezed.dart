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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppFailure {
  String get message => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  String? get uriPath => throw _privateConstructorUsedError;
}

/// @nodoc

class _$AppFailureImpl extends _AppFailure {
  const _$AppFailureImpl(
      {required this.message, required this.name, this.code, this.uriPath})
      : super._();

  @override
  final String message;
  @override
  final String name;
  @override
  final int? code;
  @override
  final String? uriPath;

  @override
  String toString() {
    return 'AppFailure(message: $message, name: $name, code: $code, uriPath: $uriPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.uriPath, uriPath) || other.uriPath == uriPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, name, code, uriPath);
}

abstract class _AppFailure extends AppFailure {
  const factory _AppFailure(
      {required final String message,
      required final String name,
      final int? code,
      final String? uriPath}) = _$AppFailureImpl;
  const _AppFailure._() : super._();

  @override
  String get message;
  @override
  String get name;
  @override
  int? get code;
  @override
  String? get uriPath;
}
