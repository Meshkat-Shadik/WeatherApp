import 'package:fpdart/fpdart.dart';
import 'package:material_ui/material_ui.dart';
import 'package:weather_app/core/common/state/api_result.dart';
import 'package:weather_app/features/location/application/location_provider.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:weather_app/core/failure/app_failure.dart';
import 'package:weather_app/core/failure/network_failure.dart';
import 'package:weather_app/features/weather/data/entities/weather_entity.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository.dart';

final sampleWeather = WeatherEntity(
  cityName: 'Dhaka',
  condition: 'Clouds',
  description: 'broken clouds',
  temperature: 29.4,
  feelsLike: 33.1,
  humidity: 74,
  pressure: 1008,
  windSpeed: 3.6,
  windGust: 5.2,
  iconUrl: 'https://openweathermap.org/img/wn/04d@2x.png',
  observedAt: DateTime(2026, 11, 18, 14, 30),
  sunrise: DateTime(2026, 11, 18, 6, 12),
  sunset: DateTime(2026, 11, 18, 17, 14),
);

const sampleFailure = NetworkFailure(
  name: 'Not Found',
  message: 'city not found',
  uriPath: '/weather',
  code: 404,
);

enum ScreenState { data, loading, error }

/// Stands in for the network: the screen's real notifier runs against it.
class const FakeWeatherRepository(final ScreenState screenState)
    implements WeatherRepository {
  @override
  Future<Either<AppFailure, WeatherEntity>> getWeather(String cityName) =>
      switch (screenState) {
        .data => Future.value(
          Right(sampleWeather.copyWith(cityName: cityName)),
        ),
        .error => Future.value(const Left(sampleFailure)),
        .loading => Future.delayed(
          const Duration(days: 1),
          () => Right(sampleWeather),
        ),
      };
}

ScreenState screenStateKnob(BuildContext context) =>
    context.knobs.object.segmented(
      label: 'State',
      options: ScreenState.values,
      labelBuilder: (s) => s.name,
    );

ApiResult<String> locationResult(BuildContext context, ScreenState state) =>
    switch (state) {
      .data => ApiSuccess(
        context.knobs.string(
          label: 'GPS city',
          initialValue: 'Dhaka, Bangladesh',
        ),
      ),
      .loading => const ApiLoading(),
      // Real failures: the screen branches on identity (blocked → Settings).
      .error => ApiError(
        context.knobs.object.segmented(
          label: 'Permission',
          options: const [LocationNotifier.denied, LocationNotifier.blocked],
          labelBuilder: (f) =>
              f == LocationNotifier.blocked ? 'blocked' : 'denied',
        ),
      ),
    };
