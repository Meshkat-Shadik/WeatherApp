//independent sources
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/src/feature/common/providers.dart';
import 'package:weather_app/src/feature/location/application/notifiers/location_notifier.dart';
import 'package:weather_app/src/feature/weather/domain/base_repositories/base_weather_repository.dart';
import 'package:weather_app/src/feature/weather/infrastructure/repository/weather_repository.dart';

part 'providers.g.dart';

@riverpod
WeatherRepository getWeatherRepository(GetWeatherRepositoryRef ref) {
  final apiService = ref.read(apiServiceProvider);
  return WeatherRepositoryImpl(apiService: apiService);
}

@riverpod
class GetCityName extends _$GetCityName {
  @override
  String build() {
    final locationState = ref.watch(locationNotifierProvider);
    return locationState.maybeWhen(
      data: (cityName) => cityName,
      orElse: () => '',
    );
  }

  void setCityName(String cityName) {
    state = cityName;
  }
}
