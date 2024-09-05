import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/feature/location/domain/base_repositories/base_location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  @override
  Future<Position> getCoordinates() async {
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: AndroidSettings(
          accuracy: LocationAccuracy.best,
          distanceFilter: 10,
          timeLimit: Duration(seconds: 4)),
    );
    return position;
  }

  @override
  Future<Placemark> getLocationName(double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemarks[0];
    return place;
  }
}
