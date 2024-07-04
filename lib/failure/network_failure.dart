// ignore_for_file: , depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/failure/app_failure.dart';
import 'package:weather_app/helper/colored_logger.dart';
import 'package:weather_app/networking/status_code.dart';

part 'network_failure.freezed.dart';

@Freezed(copyWith: true)
class NetworkFailure with _$NetworkFailure implements AppFailure {
  const factory NetworkFailure({
    required String name,
    required String message,
    required String uriPath,
    required int statusCode,
  }) = _NetworkFailure;

  static NetworkFailure getDioException(Exception error) {
    if (error is DioException) {
      final code = error.response?.statusCode;
      final status = getStatusCode(code);
      final path = error.requestOptions.path;
      final message = _handleDioErrorMessage(error);

      return NetworkFailure(
        name: status?.name ?? 'Unrecognized error',
        uriPath: path,
        message: message,
        statusCode: code ?? 0,
      );
    }
    return const NetworkFailure(
      name: 'Unrecognized error',
      uriPath: '',
      message: 'Unrecognized error',
      statusCode: 0,
    );
  }

  // Helper method to handle different types of Dio exceptions
  static String _handleDioErrorMessage(DioException error) {
    ColoredLogger.White.log("DioException: $error");
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return "Timeout occurred while sending or receiving";
      case DioExceptionType.badResponse:
        ColoredLogger.White.log("Bad Response: ${error.response?.data}");
        return error.message ?? 'N/A';
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        return error.message ?? 'N/A';
      case DioExceptionType.badCertificate:
        return "Internal Server Error";
      case DioExceptionType.connectionError:
        return "Connection Error";
      default:
        return "Unknown Error";
    }
    return "Unknown Error";
  }
}
