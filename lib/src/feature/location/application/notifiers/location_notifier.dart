import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/src/core/failure/failure_mapper.dart';
import 'package:weather_app/src/core/helper/colored_logger.dart';
import 'package:weather_app/src/core/utils/permission_manager.dart';
import 'package:weather_app/src/feature/common/states/api_state.dart';
import 'package:weather_app/src/feature/location/application/providers.dart';

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
