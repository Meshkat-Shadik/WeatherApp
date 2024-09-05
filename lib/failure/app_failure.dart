import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

@Freezed(copyWith: false)
abstract class AppFailure implements _$AppFailure, Exception {
  const AppFailure._();

  const factory AppFailure({
    required String message,
    required String name,
    int? code,
    String? uriPath,
  }) = _AppFailure;
}

extension AppFailureCopyWithX on AppFailure {
  AppFailure copyWith({
    String? message,
    String? name,
  }) {
    return AppFailure(
      message: message ?? this.message,
      name: name ?? this.name,
      code: code,
      uriPath: uriPath,
    );
  }
}
