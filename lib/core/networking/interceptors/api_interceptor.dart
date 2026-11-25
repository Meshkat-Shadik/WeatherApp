import 'package:dio/dio.dart';

/// Turns error-shaped responses into [DioException]s so repositories see one
/// failure path: 4xx/5xx statuses, and 200s whose body says `success: false`.
class ApiInterceptor extends Interceptor {
  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final status = response.statusCode ?? 0;
    final data = response.data;

    if (status >= 400) {
      return handler.reject(_reject(response, _message(data), status), true);
    }
    if (data case {'success': false}) {
      final code = switch (data) {
        {'code': final int c} => c,
        _ => 503,
      };
      return handler.reject(_reject(response, _message(data), code), true);
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final offline = switch (err.type) {
      .connectionError ||
      .sendTimeout ||
      .receiveTimeout ||
      .connectionTimeout => true,
      _ => false,
    };
    handler.next(
      offline
          ? err.copyWith(
              type: .connectionError,
              message: 'No internet connection',
            )
          : err,
    );
  }

  static String? _message(Object? data) => switch (data) {
    {'message': final Object msg} => '$msg',
    {'detail': final Object msg} => '$msg',
    _ => null,
  };

  static DioException _reject(
    Response<dynamic> response,
    String? message,
    int status,
  ) => DioException(
    requestOptions: response.requestOptions,
    response: Response(
      requestOptions: response.requestOptions,
      statusCode: status,
      data: response.data,
    ),
    type: .badResponse,
    message: message ?? 'Unknown error',
  );
}
