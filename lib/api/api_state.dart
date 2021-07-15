import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/infrastructure/Model/weather_model/weather_data.dart';

part 'api_state.freezed.dart';

@freezed
abstract class WeatherDataState with _$WeatherDataState {
  const factory WeatherDataState.initial() = _UserInitial;
  const factory WeatherDataState.loading() = _UserLoading;
  const factory WeatherDataState.success(WeatherData weatherData) =
      _UserLoadedSuccess;
  const factory WeatherDataState.error([String? message]) = _UserLoadedError;
}
