import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/core/common/providers/providers.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart';

part 'weather_repository_provider.g.dart';

@riverpod
WeatherRepository weatherRepository(Ref ref) =>
    WeatherRepositoryImpl(ref.watch(apiServiceProvider));
