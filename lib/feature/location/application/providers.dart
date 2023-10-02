import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/feature/common/states/api_state.dart';
import 'package:weather_app/feature/location/application/notifiers/location_notifier.dart';
import 'package:weather_app/feature/location/domain/base_repositories/base_location_repository.dart';
import 'package:weather_app/feature/location/infrastructure/location_repository.dart';

final _locationRepositoryProvider =
    Provider<LocationRepository>((ref) => LocationRepositoryImpl());

//
final locationProvider = StateNotifierProvider.autoDispose<LocationStateNotifer,
    ApiRequestState<String, String>>(
  (ref) => LocationStateNotifer(
    ref.watch(_locationRepositoryProvider),
  ),
);
