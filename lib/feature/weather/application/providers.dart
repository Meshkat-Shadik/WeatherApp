//independent sources
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/feature/common/providers.dart';
import 'package:weather_app/feature/location/application/providers.dart';
import 'package:weather_app/feature/weather/application/notifiers/weather_notifier.dart';
import 'package:weather_app/feature/common/states/api_state.dart';
import 'package:weather_app/feature/weather/domain/base_repositories/base_weather_repository.dart';
import 'package:weather_app/feature/weather/domain/entity/weather_full_entity.dart';
import 'package:weather_app/feature/weather/infrastructure/repository/weather_repository.dart';

//repository providers
final _weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return WeatherRepositoryImpl(apiService: apiService);
});

//notifier providers
final weatherProvider = StateNotifierProvider.autoDispose.family<
    WeatherStateNotifer, ApiRequestState<WeatherFullEntity, String>, String>(
  (ref, cityName) => WeatherStateNotifer(
    ref.watch(_weatherRepositoryProvider),
    cityName,
  ),
);

final cityNameProvider = StateProvider.autoDispose<String>((ref) {
  final locationState = ref.watch(locationProvider);
  return locationState.maybeWhen(
    data: (cityName) => cityName,
    orElse: () => '',
  );
});
