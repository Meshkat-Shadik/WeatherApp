// ignore_for_file: body_might_complete_normally_nullable

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/helper/typedefs.dart';

class RefreshTokenInterceptorHelper {
  static Future<Response<dynamic>> retry(
    Dio dio,
    RequestOptions requestOptions,
  ) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  static Future<String?> refreshTokenRequest({
    required Dio tokenDio,
    required JSON data,
    required Ref ref,
  }) async {
    debugPrint('--> REFRESHING TOKEN');
    try {
      //handle refresh token request
    } on DioException catch (_) {
      //if token refresh fails, clear dio and return null
      return null;
    }
  }

  //refresh sessionId request
  static Future<int?> refreshSessionIdRequest({
    required Dio tokenDio,
    required String token,
    required Ref ref,
  }) async {
    debugPrint('--> REFRESHING SESSION ID');
    try {
      //handle refresh token request
    } on DioException catch (_) {
      //if token refresh fails, clear dio and return null
      return null;
    }
    return null;
  }
}
