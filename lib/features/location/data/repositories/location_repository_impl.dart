import 'package:fpdart/fpdart.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/failure/app_failure.dart';
import 'package:weather_app/core/failure/failure_mapper.dart';
import 'package:weather_app/features/location/data/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  @override
  Future<Either<AppFailure, String>> currentCity() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: .best,
          distanceFilter: 10,
          timeLimit: Duration(seconds: 4),
        ),
      );
      final places = await Geocoding().placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      final place = places.first;
      return Right('${place.locality}, ${place.country}');
    } catch (e) {
      return Left(FailureMapper.getFailures(e));
    }
  }
}
