import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/application/states/api_state.dart';
import 'package:weather_app/domain/repository/base_location_repository.dart';

class LocationStateNotifer
    extends StateNotifier<ApiRequestState<String, String>> {
  final LocationRepository locationRepository;
  LocationStateNotifer(this.locationRepository)
      : super(const ApiRequestState.idle()) {
    getMyLocation();
  }

  Future<void> getMyLocation() async {
    try {
      state = ApiRequestState.loading();
      Position data = await locationRepository.getCoordinates();
      Placemark place = await locationRepository.getLocationName(
          data.latitude, data.longitude);
      String address = "${place.locality}, ${place.country}";
      state = ApiRequestState<String, String>.data(data: address);
    } catch (e) {
      state = ApiRequestState.failed(reason: "$e");
    }
  }
}
