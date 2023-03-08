import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/application/states/api_state.dart';
import 'package:weather_app/domain/repository/base_location_repository.dart';

class LocationStateNotifer extends StateNotifier<ApiRequestState<String>> {
  final LocationRepository locationRepository;
  LocationStateNotifer(this.locationRepository)
      : super(const ApiRequestState.idle());

  Future<void> getMyLocation() async {
    try {
      state = ApiRequestState.loading();
      Position data = await locationRepository.getCoordinates();
      Placemark place = await locationRepository.getLocationName(
          data.latitude, data.longitude);
      String address = "${place.locality}, ${place.country}";
      print("#####################");
      print(address);
      print("#####################");
      state = ApiRequestState<String>.data(data: address);
    } catch (e) {
      state = ApiRequestState.failed(reason: "$e");
    }
  }
}
