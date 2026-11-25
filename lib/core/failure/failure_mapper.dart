import 'package:dio/dio.dart';
import 'package:weather_app/core/failure/app_failure.dart';
import 'package:weather_app/core/failure/local_failure.dart';
import 'package:weather_app/core/failure/network_failure.dart';

abstract final class FailureMapper {
  static AppFailure getFailures(Object? error) => switch (error) {
    AppFailure() => error,
    DioException() => NetworkFailure.fromDioException(error),
    _ => LocalFailure.fromException(error),
  };
}
