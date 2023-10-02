import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather_app/helper/typedefs.dart';
import 'package:weather_app/networking/network_exception.dart';

abstract interface class ApiInterface {
  const ApiInterface();

  Future<Either<NetworkException, List<T>>> getListofListData<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(List responseBody) converter,
  });

  Future<Either<NetworkException, List<T>>> getListofMapData<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(JSON responseBody) converter,
  });

  Future<Either<NetworkException, T>> getSingleData<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(JSON responseBody) converter,
  });

  Future<Either<NetworkException, T>> setData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(JSON response) converter,
  });

  //delete response true or false
  Future<Either<NetworkException, bool>> deleteDataBoolResponse({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
  });

  Future<Either<NetworkException, T>> updateData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(JSON response) converter,
  });

  /// This method is used to delete data and response back the deleted `Object<T>`.
  Future<Either<NetworkException, T>> deleteData<T>({
    required String endpoint,
    JSON? data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(JSON response) converter,
  });

  //get a single unit of data
  Future<Either<NetworkException, T>> getSingleUnitData<T>({
    required String endpoint,
    JSON? bodyData,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(T responseBody) converter,
  });

  void cancelRequests({CancelToken? cancelToken});
}
