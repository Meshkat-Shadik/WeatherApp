import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/core/common/state/api_result.dart';
import 'package:weather_app/features/weather/application/weather_repository_provider.dart';
import 'package:weather_app/features/weather/data/entities/weather_entity.dart';

part 'weather_provider.g.dart';

/// Weather for one city — a family keyed by the city in the route, so the
/// screen needs no "selected city" provider set before navigating.
@riverpod
class WeatherNotifier extends _$WeatherNotifier {
  @override
  ApiResult<WeatherEntity> build(String city) {
    Future.microtask(fetch);
    return const ApiLoading();
  }

  Future<void> fetch() async {
    state = const ApiLoading();
    final result = await ref.read(weatherRepositoryProvider).getWeather(city);
    if (!ref.mounted) return;
    state = switch (result) {
      Left(:final value) => ApiError(value),
      Right(:final value) => ApiSuccess(value),
    };
  }
}
