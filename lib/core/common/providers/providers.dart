import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/core/networking/interceptors/api_interceptor.dart';
import 'package:weather_app/core/networking/network_api_service.dart';
import 'package:weather_app/core/networking/url_config.dart';
import 'package:weather_app/core/utils/app_logger.dart';

part 'providers.g.dart';

@riverpod
Dio dio(Ref ref) =>
    Dio(
        BaseOptions(
          baseUrl: appBaseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
          validateStatus: (_) => true,
          receiveDataWhenStatusError: true,
        ),
      )
      ..interceptors.addAll([
        if (kDebugMode)
          LogInterceptor(responseBody: true, logPrint: (o) => log.d('$o')),
        ApiInterceptor(),
      ]);

@riverpod
NetworkApiService apiService(Ref ref) =>
    NetworkApiService(ref.watch(dioProvider), baseUrl: appBaseUrl);
