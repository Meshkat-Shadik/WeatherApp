import 'package:dio/dio.dart';
import 'package:weather_app/domain/helper/typedefs.dart';

import 'api_interface.dart';
import 'dio_service.dart';

class ApiService implements ApiInterface {
  late final DioService _dioService;

  ApiService(
    DioService dioService,
  ) : _dioService = dioService;

  @override
  Future<List<T>> getListData<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(JSON responseBody) converter,
  }) async {
    final data = await _dioService.get(
      endpoint: endpoint,
      options: Options(headers: <String, Object?>{
        'requiresAuthToken': requiresAuthToken,
      }),
      queryParams: queryParams,
      cancelToken: cancelToken,
    );
    return (data['data'] as List<Object?>)
        .map((dataMap) => converter(dataMap as JSON))
        .toList();
  }

  @override
  Future<T> getSingleData<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(JSON responseBody) converter,
  }) async {
    final data = await _dioService.get(
      endpoint: endpoint,
      queryParams: queryParams,
      options: Options(headers: <String, Object?>{
        'requiresAuthToken': requiresAuthToken,
      }),
      cancelToken: cancelToken,
    );
    print('******* GET SINGLE DATA *****+36***');
    print(data.toString());
    print('####### GET SINGLE DATA ########');
    return converter(data);
  }

  @override
  Future<T> setData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    JSON? queryParams,
    bool requiresAuthToken = true,
    required T Function(JSON response) converter,
  }) async {
    final dataMap = await _dioService.post(
      endpoint: endpoint,
      data: data,
      queryParams: queryParams,
      options: Options(headers: <String, Object?>{
        'requiresAuthToken': requiresAuthToken,
      }),
      cancelToken: cancelToken,
    );
    return converter(dataMap);
  }

  @override
  Future<T> updateData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(JSON response) converter,
  }) async {
    final dataMap = await _dioService.patch(
      endpoint: endpoint,
      data: data,
      options: Options(headers: <String, Object?>{
        'requiresAuthToken': requiresAuthToken,
      }),
      cancelToken: cancelToken,
    );

    return converter(dataMap);
  }

  @override
  Future<T> deleteData<T>({
    required String endpoint,
    JSON? data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(JSON response) converter,
  }) async {
    final dataMap = await _dioService.delete(
      endpoint: endpoint,
      data: data,
      options: Options(headers: <String, Object?>{
        'requiresAuthToken': requiresAuthToken,
      }),
      cancelToken: cancelToken,
    );

    return converter(dataMap);
  }

  @override
  void cancelRequests({CancelToken? cancelToken}) {
    _dioService.cancelRequests(cancelToken: cancelToken);
  }
}
