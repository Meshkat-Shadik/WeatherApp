import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather_app/helper/colored_logger.dart';
import 'package:weather_app/helper/typedefs.dart';
import 'package:weather_app/networking/network_exception.dart';
import 'api_interface.dart';
import 'dio_service.dart';

class ApiService implements ApiInterface {
  late final DioService _dioService;

  ApiService(
    DioService dioService,
  ) : _dioService = dioService;

  @override
  Future<Either<NetworkException, T>> getSingleData<T>({
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
    //print('******* GET SINGLE DATA ********');
    //print(data.toString());
    // print('####### GET SINGLE DATA ########');
    return data.fold(
      (l) => Left(l),
      (r) => Right(converter(r)),
    );
  }

  @override
  Future<Either<NetworkException, T>> setData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    JSON? queryParams,
    bool requiresAuthToken = true,
    required T Function(JSON response) converter,
  }) async {
    //print('called set Data endpoint: $endpoint');
    // print('data: ${data}');
    final dataMap = await _dioService.post<JSON>(
      endpoint: endpoint,
      data: data,
      queryParams: queryParams,
      options: Options(headers: <String, Object?>{
        'requiresAuthToken': requiresAuthToken,
      }),
      cancelToken: cancelToken,
    );
    return dataMap.fold(
      (l) => Left(l),
      (r) => Right(converter(r)),
    );
  }

  @override
  Future<Either<NetworkException, T>> updateData<T>({
    required String endpoint,
    JSON? data,
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
    return dataMap.fold(
      (l) => Left(l),
      (r) => Right(converter(r)),
    );
  }

  @override
  Future<Either<NetworkException, T>> deleteData<T>({
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

    return dataMap.fold(
      (l) => Left(l),
      (r) => Right(converter(r)),
    );
  }

  @override
  void cancelRequests({CancelToken? cancelToken}) {
    _dioService.cancelRequests(cancelToken: cancelToken);
  }

  @override
  Future<Either<NetworkException, List<T>>> getListofListData<T>(
      {required String endpoint,
      JSON? queryParams,
      CancelToken? cancelToken,
      bool requiresAuthToken = true,
      required T Function(List responseBody) converter}) async {
    final data = await _dioService.getList(
      endpoint: endpoint,
      options: Options(headers: <String, Object?>{
        'requiresAuthToken': requiresAuthToken,
      }),
      queryParams: queryParams,
      cancelToken: cancelToken,
    );

    return data.fold(
      (l) => Left(l),
      (r) {
        final res = (r).map((dataMap) => converter(dataMap as List)).toList();
        return Right(res);
      },
    );
  }

  @override
  Future<Either<NetworkException, List<T>>> getListofMapData<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    JSON? bodyData,
    required T Function(JSON responseBody) converter,
    bool isGet = true,
  }) async {
    final data = await _dioService.getList(
      endpoint: endpoint,
      options: Options(headers: <String, Object?>{
        'requiresAuthToken': requiresAuthToken,
      }),
      queryParams: queryParams,
      cancelToken: cancelToken,
      isGet: isGet,
      data: !isGet ? bodyData : null,
    );

    return data.fold(
      (l) => Left(l),
      (r) {
        final res = (r).map((dataMap) => converter(dataMap as JSON)).toList();
        return Right(res);
      },
    );
  }

  @override
  Future<Either<NetworkException, T>> getSingleUnitData<T>({
    required String endpoint,
    JSON? bodyData,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(T responseBody) converter,
  }) async {
    final data = await _dioService.post<num>(
      endpoint: endpoint,
      data: bodyData,
      options: Options(headers: <String, Object?>{
        'requiresAuthToken': requiresAuthToken,
      }),
      cancelToken: cancelToken,
    );
    ColoredLogger.Green.log(data);
    return data.fold(
      (l) => Left(l),
      (r) => Right(converter(r as T)),
    );
  }

  @override
  Future<Either<NetworkException, bool>> deleteDataBoolResponse({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
  }) async {
    final response = await _dioService.delete<bool>(
      endpoint: endpoint,
      data: data,
      options: Options(headers: <String, Object?>{
        'requiresAuthToken': requiresAuthToken,
      }),
      cancelToken: cancelToken,
    );
    return response.fold(
      (l) => Left(l),
      (r) {
        if (r == null) {
          return const Right(true);
        } else {
          return Right(r);
        }
      },
    );
  }
}
