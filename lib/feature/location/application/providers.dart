import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/feature/location/domain/base_repositories/base_location_repository.dart';
import 'package:weather_app/feature/location/infrastructure/location_repository.dart';

part 'providers.g.dart';

@riverpod
LocationRepository getLocationRepository(GetLocationRepositoryRef ref) {
  return LocationRepositoryImpl();
}
