import 'package:fpdart/fpdart.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/core/common/state/api_result.dart';
import 'package:weather_app/core/failure/local_failure.dart';
import 'package:weather_app/core/services/permission_manager.dart';
import 'package:weather_app/features/location/application/location_repository_provider.dart';

part 'location_provider.g.dart';

/// The device's current city. Locates on first watch; `ref.invalidate`
/// re-runs it (pull-to-refresh).
@riverpod
class LocationNotifier extends _$LocationNotifier {
  @override
  ApiResult<String> build() {
    Future.microtask(locate);
    return const ApiLoading();
  }

  Future<void> locate() async {
    state = const ApiLoading();
    final permission = await PermissionManager.request(Permission.location);
    if (permission != .granted) {
      if (ref.mounted) {
        state = ApiError(permission == .blocked ? blocked : denied);
      }
      return;
    }
    final result = await ref.read(locationRepositoryProvider).currentCity();
    if (!ref.mounted) return;
    state = switch (result) {
      Left(:final value) => ApiError(value),
      Right(:final value) => ApiSuccess(value),
    };
  }

  Future<void> openSettings() => PermissionManager.openSettings();

  static const denied = LocalFailure(
    name: 'PermissionDenied',
    message: 'Allow location access to see your city',
  );

  /// The OS won't prompt again; only Settings can grant it now.
  static const blocked = LocalFailure(
    name: 'PermissionBlocked',
    message: 'Location is off for this app. Turn it on in Settings.',
  );
}
