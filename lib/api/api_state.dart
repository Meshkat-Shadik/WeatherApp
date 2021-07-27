import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/infrastructure/Model/weather_model/weather_data.dart';

part 'api_state.freezed.dart';

@freezed
abstract class WeatherDataState with _$WeatherDataState {
  const factory WeatherDataState.initial() = _WeatherInitial;
  const factory WeatherDataState.loading() = _WeatherLoading;
  const factory WeatherDataState.success(WeatherData weatherData) =
      _WeatherLoadedSuccess;
  const factory WeatherDataState.error([String? message]) = _WeatherLoadedError;
}

@freezed
abstract class LocationDataState with _$LocationDataState {
  const factory LocationDataState.initial() = _LocationInitial;
  const factory LocationDataState.loading() = _LocationLoading;
  const factory LocationDataState.success(String address) = _LocationSuccess;
  const factory LocationDataState.error([String? message]) =
      _LocationLoadedError;
}
