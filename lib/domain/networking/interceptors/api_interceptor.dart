import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (response.statusCode == 404) {
      return handler.reject(
        DioError(
          requestOptions: response.requestOptions,
          response: response,
        ),
      );
    }
    return handler.next(response);
  }
}
