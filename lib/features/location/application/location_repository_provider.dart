import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/features/location/data/repositories/location_repository.dart';
import 'package:weather_app/features/location/data/repositories/location_repository_impl.dart';

part 'location_repository_provider.g.dart';

@riverpod
LocationRepository locationRepository(Ref ref) => LocationRepositoryImpl();
