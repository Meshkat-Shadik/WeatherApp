// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_field, unused_local_variable
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/feature/common/providers.dart';
import 'package:weather_app/helper/colored_logger.dart';

class ApiInterceptor extends QueuedInterceptor {
  late final Ref _ref;
  ApiInterceptor(this._ref) : super();
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    //injection of auth token in header
    if (options.headers.containsKey('requiresAuthToken')) {
      if (options.headers['requiresAuthToken'] == true) {
        // final token = _ref.read(storageProvider).getAuthToken();
        // options.headers
        // .addAll(<String, Object?>{'Authorization': 'Bearer $token'});
      }
      options.headers.remove('requiresAuthToken');
    }
    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if ((response.statusCode ?? 400) >= 400 &&
        (response.statusCode ?? 400) <= 500) {
      return handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['message'],
        ),
      );
    }
    return handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    ColoredLogger.Yellow.log(err.message);
    ColoredLogger.Yellow.log(err.requestOptions.uri);
    String substringToCheck1 = "something wrong with token";
    String substringToCheck2 = "Invalid session id";
    String substringToCheck3 = "Signature has expired";

    final _dio = _ref.read(dioProvider);
    if (err.message != null) {
      final body = err.message;
      var error = body as String;
      if (error.contains(substringToCheck1) ||
          error.contains(substringToCheck2) ||
          error.contains(substringToCheck3)) {
        //handle refresh token
      }
    } else {
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          message: err.error.toString(),
        ),
      );
    }
  }
}
