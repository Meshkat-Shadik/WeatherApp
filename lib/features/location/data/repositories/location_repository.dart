import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/failure/app_failure.dart';

abstract interface class LocationRepository {
  /// "Locality, Country" for the device's current position.
  Future<Either<AppFailure, String>> currentCity();
}
