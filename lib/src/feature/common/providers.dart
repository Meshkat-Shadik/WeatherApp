//dio providers
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/src/core/networking/interceptors/api_interceptor.dart';
import 'package:weather_app/src/core/networking/interceptors/logging_interceptor.dart';
import 'package:weather_app/src/core/networking/network_api_service.dart';
import 'package:weather_app/src/core/networking/url_config.dart';
import 'package:weather_app/src/routes/router.dart';

part 'providers.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio(BaseOptions(
    baseUrl: appBaseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
    validateStatus: (status) => true,
    receiveDataWhenStatusError: true,
  ))
    ..interceptors.add(
      PrettyDioLogger(
        responseBody: true,
      ),
    )
    ..interceptors.add(ApiInterceptor(ref));
}

@riverpod
NetworkApiService apiService(ApiServiceRef ref) {
  final dio = ref.read(dioProvider);
  return NetworkApiService(dio, baseUrl: appBaseUrl);
}

@riverpod
AppRouter appRouter(AppRouterRef ref) {
  return AppRouter();
}
