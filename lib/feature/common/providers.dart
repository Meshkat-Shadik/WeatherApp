//dio providers
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/networking/interceptors/api_interceptor.dart';
import 'package:weather_app/networking/interceptors/logging_interceptor.dart';
import 'package:weather_app/networking/network_api_service.dart';
import 'package:weather_app/networking/url_config.dart';
import 'package:weather_app/routes/router.dart';

final dioProvider = Provider<Dio>((ref) {
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
});

final apiServiceProvider = Provider<NetworkApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return NetworkApiService(dio);
});

final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter();
});
