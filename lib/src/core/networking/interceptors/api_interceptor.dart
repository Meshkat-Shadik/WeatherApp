// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_field, unused_local_variable
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/src/core/helper/colored_logger.dart';

class ApiInterceptor extends Interceptor {
  late final Ref _ref;
  ApiInterceptor(this._ref) : super();
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // final token = _ref.read(sharedPrefProvider).getAuthToken;

    ColoredLogger.Yellow.log('🎯LOG URL PATH: ${options.headers}');
    ColoredLogger.Yellow.log('🔰Content-Type: ${options.contentType}');
    ColoredLogger.Yellow.log('🔰Request method: ${options.toCustomString()}');
    // ColoredLogger.Yellow.log('🔰Token: $token');

    //add header
    // options.headers.addAll({
    // "System-key": Config.systemKey,
    // });

    //add token
    // if (options.headers.containsKey('requiresAuthToken')) {
    //   if (options.headers['requiresAuthToken'] == true) {
    //     ColoredLogger.White.log('🔰Token added to the header $token');
    //     options.headers.addAll(
    //       <String, Object?>{
    //         'Authorization': 'Bearer $token',
    //       },
    //     );
    //   }
    //   options.headers.remove('requiresAuthToken');
    // }

    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    ColoredLogger.Green.log('🎯LOG URL PATH: ${response.requestOptions.uri}');
    ColoredLogger.Green.log('🔟Response status code: ${response.statusCode}');
    ColoredLogger.Magenta.log('🍿Response data: ${response.data}');

    if (response.statusCode != null &&
        (response.statusCode! >= 400 && response.statusCode! <= 599)) {
      return handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['detail'].toString(),
        ),
        true,
      );
    }
    return handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // in case of no internet connection
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionTimeout) {
      return handler.reject(
        DioException(
          type: DioExceptionType.connectionError,
          requestOptions: err.requestOptions,
          response: err.response,
          message: 'No internet connection',
        ),
      );
    } else {
      ColoredLogger.Red.log('🔴Error: ${err.message}');
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

//custom extension for showing the origin, host
extension RequestOptionsToStringX on RequestOptions {
  String toCustomString() {
    return 'method: $method, path: $path, origin: ${headers["Origin"]}, host: ${headers["Host"]}';
  }
}
