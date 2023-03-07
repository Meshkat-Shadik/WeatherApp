import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationRepository {
  Future<Position> getCoordinates();
  Future<Placemark> getLocationName(double longitude, double latitude);
}
