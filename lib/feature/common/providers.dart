//dio providers
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/networking/api_endpoint.dart';
import 'package:weather_app/networking/api_service.dart';
import 'package:weather_app/networking/dio_service.dart';
import 'package:weather_app/networking/interceptors/api_interceptor.dart';
import 'package:weather_app/routes/router.dart';

final dioProvider = Provider<Dio>((ref) {
  final baseOptions = BaseOptions(
    baseUrl: ApiEndpoint.baseUrl,
  );
  return Dio(baseOptions);
});

final dioServiceProvider = Provider<DioService>((ref) {
  final dio = ref.watch(dioProvider);
  return DioService(
    dioClient: dio,
    interceptors: [
      ApiInterceptor(ref),
    ],
  );
});

final apiServiceProvider = Provider<ApiService>((ref) {
  final dioService = ref.watch(dioServiceProvider);
  return ApiService(dioService);
});

final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter();
});
