import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationData {
  const LocationData({
    this.position,
    this.place,
  });

  final Position? position;
  final Placemark? place;

  LocationData copyWith({Position? position, Placemark? place}) {
    return LocationData(
      position: position ?? this.position,
      place: place ?? this.place,
    );
  }
}
