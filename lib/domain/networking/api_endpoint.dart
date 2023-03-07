// ignore_for_file: constant_identifier_names
// DO NOT USE 'dartfmt' on this file for formatting

import 'package:flutter/material.dart';
import 'package:weather_app/application/states/credentials.dart' as credentials;

@immutable
class ApiEndpoint {
  const ApiEndpoint._();

  static const baseUrl = String.fromEnvironment(
    'API_ENDPOINT',
    defaultValue: credentials.baseUrl,
  );

  static String basic(WeatherEndPoint endpoint, {String? cityName}) {
    switch (endpoint) {
      case WeatherEndPoint.DEFAULT:
        return credentials.baseUrl;
      case WeatherEndPoint.WITH_CITY_NAME:
        assert(cityName != null,
            'City name is required WeatherEndPoint.WITH_CITY_NAME endpoint');
        return credentials.baseUrl + cityName!;
      default:
        throw Exception('Invalid endpoint');
    }
  }
}

enum WeatherEndPoint {
  DEFAULT,
  WITH_CITY_NAME,
}
