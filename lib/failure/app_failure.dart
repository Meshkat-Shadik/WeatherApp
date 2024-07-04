import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

@freezed
abstract class AppFailure with _$AppFailure {
  const AppFailure._();

  const factory AppFailure({
    required String message,
    required String name,
    String? uriPath,
    int? statusCode,
  }) = _AppFailure;
}

extension AppFailureCopyWithX on AppFailure {
  AppFailure copyWith({
    String? message,
    String? name,
    String? uriPath,
    int? statusCode,
  }) {
    return AppFailure(
      message: message ?? this.message,
      name: name ?? this.name,
      uriPath: uriPath ?? this.uriPath,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}
