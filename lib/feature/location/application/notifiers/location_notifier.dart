import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/failure/failure_mapper.dart';
import 'package:weather_app/feature/common/states/api_state.dart';
import 'package:weather_app/feature/location/application/providers.dart';
import 'package:weather_app/helper/colored_logger.dart';
import 'package:weather_app/utils/permission_manager.dart';

part 'location_notifier.g.dart';

@riverpod
class LocationNotifier extends _$LocationNotifier {
  ApiRequestState build() => ApiRequestState.idle();

  Future<void> getMyLocation() async {
    try {
      await PermissionManager.requestPermissions(
        [Permission.location], // list of permissions to request
        () async {
          // callback to be executed if all permissions are granted
          state = ApiRequestState.loading();
          final repo = ref.read(getLocationRepositoryProvider);
          Position data = await repo.getCoordinates();
          ColoredLogger.Green.log(data.toString());
          Placemark place =
              await repo.getLocationName(data.latitude, data.longitude);
          String address = "${place.locality}, ${place.country}";
          state = ApiRequestState<String>.data(data: address);
        },
      );
    } on Exception catch (e) {
      state = ApiRequestState.failed(reason: FailureMapper.getFailures(e));
    }
  }
}
