//independent sources
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/application/notifiers/location_notifier.dart';
import 'package:weather_app/application/notifiers/weather_notifier.dart';
import 'package:weather_app/application/states/api_state.dart';
import 'package:weather_app/domain/networking/api_endpoint.dart';
import 'package:weather_app/domain/networking/api_service.dart';
import 'package:weather_app/domain/networking/dio_service.dart';
import 'package:weather_app/domain/networking/interceptors/api_interceptor.dart';
import 'package:weather_app/domain/repository/base_location_repository.dart';
import 'package:weather_app/domain/repository/base_weather_repository.dart';
import 'package:weather_app/infrastructure/Model/weather_model/weather_data.dart';
import 'package:weather_app/infrastructure/repository/location_repository.dart';
import 'package:weather_app/infrastructure/repository/weather_repository.dart';

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
final _locationRepositoryProvider =
    Provider.autoDispose<LocationRepository>((ref) => LocationRepositoryImpl());

//notifier providers
final weatherProvider = StateNotifierProvider.autoDispose<WeatherStateNotifer,
    ApiRequestState<WeatherData>>(
  (ref) => WeatherStateNotifer(
    ref.watch(_weatherRepositoryProvider),
  ),
);

final locationProvider = StateNotifierProvider.autoDispose<LocationStateNotifer,
        ApiRequestState<String>>(
    (ref) => LocationStateNotifer(ref.watch(_locationRepositoryProvider)));
