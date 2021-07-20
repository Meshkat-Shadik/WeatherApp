import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/api/api_state.dart';
import 'package:weather_app/infrastructure/Model/location_model/location_data.dart';
import 'package:weather_app/infrastructure/location_repository.dart';

class LocationStateNotifer extends StateNotifier<LocationDataState> {
  final LocationRepository locationRepository;
  LocationStateNotifer(this.locationRepository)
      : super(const LocationDataState.initial());

  Future<void> getMyLocation() async {
    try {
      state = LocationDataState.initial();
      Position data = await locationRepository.getCoordinates();
      Placemark place = await locationRepository.getLocationName(
          data.latitude, data.longitude);
      String address = "${place.locality}, ${place.country}";
      state = LocationDataState.success(address);
    } catch (e) {
      state = LocationDataState.error("$e");
    }
  }
}
