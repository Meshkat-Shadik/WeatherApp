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

    //sometimes the response is not in the expected format
    //like, it may return 200 but the response is showing error
    //so, we need to handle this case

    //ex: {"code": 400, "message": "Bad Request", "success": false} with status code 200

    //we can check the response data and status code, for validating the response
    //we can use dart's Pattern matching to check the response data

    if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
      final data = response.data as Map<String, dynamic>;

      //pattern matching
      final (bool? sucess, String? message, int? code) = (
        data['success'] as bool?,
        data['message'] as String?,
        data['code'] as int?,
      );

      final isSuccess = sucess;

      if (isSuccess == false) {
        return handler.reject(
          DioException(
            requestOptions: response.requestOptions,
            response: Response(
              requestOptions: response.requestOptions,
              statusCode: (code is int) ? code : 503,
            ),
            message: message ?? 'Unknown error',
          ),
          true,
        );
      } else {
        //here the response is successful either the success is true or null
        //null means the respnose format is not as ours so we suppose it as success
        //so, we can return the response as it is
        return handler.next(response);
      }
    } else {
      return handler.next(response);
    }
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
