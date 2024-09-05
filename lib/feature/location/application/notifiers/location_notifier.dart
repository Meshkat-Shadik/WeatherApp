import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/feature/common/states/api_state.dart';
import 'package:weather_app/feature/location/domain/base_repositories/base_location_repository.dart';
import 'package:weather_app/utils/permission_manager.dart';

class LocationStateNotifer
    extends StateNotifier<ApiRequestState<String, String>> {
  final LocationRepository locationRepository;
  LocationStateNotifer(this.locationRepository)
      : super(const ApiRequestState.idle()) {
    getMyLocation();
  }

  Future<void> getMyLocation() async {
    try {
      await PermissionManager.requestPermissions(
        [Permission.location], // list of permissions to request
        () async {
          // callback to be executed if all permissions are granted
          state = ApiRequestState.loading();
          Position data = await locationRepository.getCoordinates();
          Placemark place = await locationRepository.getLocationName(
              data.latitude, data.longitude);
          String address = "${place.locality}, ${place.country}";
          state = ApiRequestState<String, String>.data(data: address);
        },
      );
    } catch (e) {
      state = ApiRequestState.failed(reason: "$e");
    }
  }
}
