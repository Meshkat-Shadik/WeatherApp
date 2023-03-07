//independent sources
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/application/location_notifier.dart';
import 'package:weather_app/application/states/api_state.dart';
import 'package:weather_app/application/weather_notifier.dart';
import 'package:weather_app/domain/repository/base_location_repository.dart';
import 'package:weather_app/domain/repository/base_weather_repository.dart';
import 'package:weather_app/domain/repository/networking/api_endpoint.dart';
import 'package:weather_app/domain/repository/networking/api_service.dart';
import 'package:weather_app/domain/repository/networking/dio_service.dart';
import 'package:weather_app/domain/repository/networking/interceptors/api_interceptor.dart';
import 'package:weather_app/infrastructure/location_repository.dart';
import 'package:weather_app/infrastructure/weather_repository.dart';

final locationClientProvider =
    Provider.autoDispose<LocationRepository>((ref) => LocationRepositoryImpl());

final locationStateNotifierProvider =
    StateNotifierProvider.autoDispose<LocationStateNotifer, ApiRequestState>(
        (ref) => LocationStateNotifer(ref.watch(locationClientProvider)));

//backup use for textEditingController
final cityNameProvider = StateProvider.autoDispose<String>((ref) => '');

//dio providers
final _dioProvider = Provider<Dio>((ref) {
  final baseOptions = BaseOptions(
    baseUrl: ApiEndpoint.baseUrl,
  );
  return Dio(baseOptions);
});

final _dioServiceProvider = Provider<DioService>((ref) {
  final dio = ref.watch(_dioProvider);
  return DioService(
    dioClient: dio,
    interceptors: [ApiInterceptor()],
  );
});

final _apiServiceProvider = Provider<ApiService>((ref) {
  final dioService = ref.watch(_dioServiceProvider);
  return ApiService(dioService);
});

//repository providers
final _weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  final apiService = ref.watch(_apiServiceProvider);
  return WeatherRepositoryImpl(apiService: apiService);
});

//notifier providers
final weatherProvider =
    StateNotifierProvider.autoDispose<WeatherStateNotifer, ApiRequestState>(
  (ref) => WeatherStateNotifer(
    ref.watch(_weatherRepositoryProvider),
  ),
);
