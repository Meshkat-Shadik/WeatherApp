import 'dart:async';

import 'package:dio/dio.dart';
import 'package:weather_app/domain/helper/typedefs.dart';

import 'network_exception.dart';

class DioService {
  late final Dio _dio;

  late final CancelToken _cancelToken;

  DioService({
    required Dio dioClient,
    Iterable<Interceptor>? interceptors,
  })  : _dio = dioClient,
        _cancelToken = CancelToken() {
    if (interceptors != null) _dio.interceptors.addAll(interceptors);
  }

  void cancelRequests({CancelToken? cancelToken}) {
    if (cancelToken == null) {
      _cancelToken.cancel('Cancelled');
    } else {
      cancelToken.cancel();
    }
  }

  Future<JSON> get({
    required String endpoint,
    JSON? queryParams,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get<JSON>(
        endpoint,
        queryParameters: queryParams,
        options: options,
        cancelToken: cancelToken ?? _cancelToken,
      );
      // print('********RESPONSE*********');
      // print(response.data);
      return response.data as JSON;
    } on Exception catch (ex) {
      print('********EX*********');
      print(ex.toString());
      throw NetworkException.getDioException(ex);
    }
  }

  Future<JSON> post({
    required String endpoint,
    JSON? data,
    JSON? queryParams,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post<JSON>(
        endpoint,
        data: data,
        queryParameters: queryParams,
        options: options,
        cancelToken: cancelToken ?? _cancelToken,
      );
      // print('DIO LOG');
      // print(response.data);
      return response.data as JSON;
    } on Exception catch (ex) {
      throw NetworkException.getDioException(ex);
    }
  }

  Future<JSON> patch({
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put<JSON>(
        endpoint,
        data: data,
        options: options,
        cancelToken: cancelToken ?? _cancelToken,
      );
      return response.data as JSON;
    } on Exception catch (ex) {
      throw NetworkException.getDioException(ex);
    }
  }

  Future<JSON> delete({
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete<JSON>(
        endpoint,
        data: data,
        options: options,
        cancelToken: cancelToken ?? _cancelToken,
      );
      return response.data as JSON;
    } on Exception catch (ex) {
      throw NetworkException.getDioException(ex);
    }
  }
}
