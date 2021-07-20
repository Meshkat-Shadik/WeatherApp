//independent sources
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;
import 'package:weather_app/application/location_notifier.dart';
import 'package:weather_app/application/weather_notifier.dart';
import 'package:weather_app/infrastructure/location_repository.dart';
import 'package:weather_app/infrastructure/weather_repository.dart';

import 'api/api_state.dart';

final weatherClientProvider =
    Provider<WeatherRepository>((ref) => WeatherRepositoryImpl(http.Client()));

final locationClientProvider =
    Provider<LocationRepository>((ref) => LocationRepositoryImpl());

//dependent sources
final weatherStateNotifierProvider =
    StateNotifierProvider<WeatherStateNotifer, WeatherDataState>(
        (ref) => WeatherStateNotifer(ref.watch(weatherClientProvider)));

final locationStateNotifierProvider =
    StateNotifierProvider<LocationStateNotifer, LocationDataState>(
        (ref) => LocationStateNotifer(ref.watch(locationClientProvider)));
