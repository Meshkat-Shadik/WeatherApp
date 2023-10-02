import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather_app/helper/typedefs.dart';

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

  Future<Either<NetworkException, JSON>> get({
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
      return right(response.data as JSON);
    } on Exception catch (ex) {
      return left(NetworkException.getDioException(ex));
    }
  }

  Future<Either<NetworkException, List>> getList({
    required String endpoint,
    JSON? queryParams,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
    bool isGet = true,
  }) async {
    try {
      final response = isGet
          ? await _dio.get<List>(
              endpoint,
              queryParameters: queryParams,
              options: options,
              cancelToken: cancelToken ?? _cancelToken,
            )
          : await _dio.post<List>(
              endpoint,
              queryParameters: queryParams,
              data: data,
              options: options,
              cancelToken: cancelToken ?? _cancelToken,
            );
      return right(response.data as List);
    } on Exception catch (ex) {
      return left(NetworkException.getDioException(ex));
    }
  }

  Future<Either<NetworkException, T>> post<T>({
    required String endpoint,
    JSON? data,
    JSON? queryParams,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      //print('hit dio with endpoint: $endpoint');
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParams,
        options: options,
        cancelToken: cancelToken ?? _cancelToken,
      );
      return right(response.data);
    } on Exception catch (ex) {
      // print('********EX*********');
      // print(ex.toString());
      return left(NetworkException.getDioException(ex));
    }
  }

  Future<Either<NetworkException, JSON>> patch({
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
      return right(response.data as JSON);
    } on Exception catch (ex) {
      return left(NetworkException.getDioException(ex));
    }
  }

  Future<Either<NetworkException, T?>> delete<T>({
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: data,
        options: options,
        cancelToken: cancelToken ?? _cancelToken,
      );
      if (response.statusCode == 204) {
        return right(null);
      } else {
        return right(response.data);
      }
    } on Exception catch (ex) {
      return left(NetworkException.getDioException(ex));
    }
  }
}
