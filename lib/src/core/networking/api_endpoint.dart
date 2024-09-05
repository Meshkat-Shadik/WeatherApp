// ignore_for_file: constant_identifier_names
// DO NOT USE 'dartfmt' on this file for formatting

import 'package:flutter/material.dart';
import 'package:weather_app/networking/url_config.dart';

@immutable
class ApiEndpoint {
  const ApiEndpoint._();

  static String getEndpoint(
    WeatherEndPoint endpoint, {
    String? cityName,
  }) {
    return switch (endpoint) {
      WeatherEndPoint.DEFAULT =>
        '/weather?q=$cityName&appid=${apiKey}&units=metric',
      WeatherEndPoint.WITH_CITY_NAME =>
        '/weather?q=$cityName&appid=${apiKey}&units=metric',
    };
  }
}

enum WeatherEndPoint {
  DEFAULT,
  WITH_CITY_NAME,
}
