import 'package:dio/dio.dart';
import 'package:weather_app/core/failure/app_failure.dart';
import 'package:weather_app/core/networking/network_misc.dart';

class const NetworkFailure({
  required super.name,
  required super.message,
  required String super.uriPath,
  required int super.code,
}) extends AppFailure {
  factory NetworkFailure.fromDioException(DioException error) => NetworkFailure(
    name: _name(error),
    uriPath: error.requestOptions.path,
    code: error.response?.statusCode ?? 0,
    message: switch (error.type) {
      .connectionTimeout ||
      .sendTimeout ||
      .receiveTimeout ||
      .transformTimeout => ErrorMessage.timeOut.name,
      .badResponse => error.message ?? ErrorMessage.badResponse.name,
      .badCertificate => ErrorMessage.internalServerError.name,
      .connectionError => error.message ?? ErrorMessage.connectionError.name,
      .unknown => _serverMessage(error),
      .cancel => ErrorMessage.unknownError.name,
    },
  );

  @override
  NetworkFailure copyWith({
    String? message,
    String? name,
    int? code,
    String? uriPath,
  }) => NetworkFailure(
    name: name ?? this.name,
    message: message ?? this.message,
    uriPath: uriPath ?? this.uriPath!,
    code: code ?? this.code!,
  );

  static String _serverMessage(DioException error) {
    final data = error.response?.data;
    if (data is String && data.isNotEmpty) return data;
    if (data case {'message': final String msg} when msg.isNotEmpty) return msg;
    final msg = error.message;
    return (msg == null || msg.isEmpty)
        ? ErrorMessage.dataUnavailable.name
        : msg;
  }

  static String _name(DioException error) {
    final status = getStatusCode(error.response?.statusCode);
    if (status != null) return status.name;
    return switch (error.type) {
      .connectionError ||
      .sendTimeout ||
      .receiveTimeout ||
      .connectionTimeout => ErrorMessage.noInternetConnection.name,
      _ => ErrorMessage.unrecognizedError.name,
    };
  }
}
