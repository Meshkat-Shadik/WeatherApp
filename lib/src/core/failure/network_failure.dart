// ignore_for_file:  depend_on_referenced_packages, no_leading_underscores_for_local_identifiers
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/core/failure/app_failure.dart';
import 'package:weather_app/src/core/networking/network_misc.dart';

part 'network_failure.freezed.dart';

@Freezed(copyWith: true)
class NetworkFailure with _$NetworkFailure implements AppFailure {
  const factory NetworkFailure({
    required String name,
    required String message,
    required String uriPath,
    required int code,
  }) = _NetworkFailure;

  static NetworkFailure getDioException(Exception error) {
    if (error is DioException) {
      final code = error.response?.statusCode;
      final path = error.requestOptions.path;
      final message = _handleDioErrorMessage(error);
      final name = _getErrorName(error);

      return NetworkFailure(
        name: name,
        uriPath: path,
        message: message,
        code: code ?? 0,
      );
    }
    //we can't be here because we checked before calling this method
    throw Exception(ErrorMessage.nonProducable.name);
  }

  // Helper method to handle different types of Dio exceptions
  static String _handleDioErrorMessage(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ErrorMessage.timeOut.name;
      case DioExceptionType.badResponse:
        return error.message ?? ErrorMessage.badResponse.name;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        return _getErrorResponseBodyFromServer(error);
      case DioExceptionType.badCertificate:
        return ErrorMessage.internalServerError.name;
      case DioExceptionType.connectionError:
        return error.message ?? ErrorMessage.connectionError.name;
      default:
        return ErrorMessage.unknownError.name;
    }
    return ErrorMessage.unknownError.name;
  }

  static String _getErrorResponseBodyFromServer(DioException error) {
    assert(error.type == DioExceptionType.unknown);
    if (error.response?.data is String) {
      return error.response?.data ?? 'Redirected to login page';
    }
    // Here Map<String, dynamic> is the type of the response body
    // You can use a proper Model class to parse the response body
    final responseBody = error.response?.data as Map<String, dynamic>?;
    String? msg = responseBody?['message'] ?? error.message;
    if (msg == null || msg.isEmpty || msg == 'null') {
      msg = ErrorMessage.dataUnavailable.name;
    }
    return msg;
  }

  static String _getErrorName(DioException error) {
    String _name = ErrorMessage.unrecognizedError.name;
    if (error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionTimeout) {
      _name = ErrorMessage.noInternetConnection.name;
    }

    final code = error.response?.statusCode;
    final status = getStatusCode(code);
    return status?.name ?? _name;
  }
}
