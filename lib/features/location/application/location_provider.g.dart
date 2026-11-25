// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The device's current city. Locates on first watch; `ref.invalidate`
/// re-runs it (pull-to-refresh).

@ProviderFor(LocationNotifier)
final locationProvider = LocationNotifierProvider._();

/// The device's current city. Locates on first watch; `ref.invalidate`
/// re-runs it (pull-to-refresh).
final class LocationNotifierProvider
    extends $NotifierProvider<LocationNotifier, ApiResult<String>> {
  /// The device's current city. Locates on first watch; `ref.invalidate`
  /// re-runs it (pull-to-refresh).
  LocationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationNotifierHash();

  @$internal
  @override
  LocationNotifier create() => LocationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiResult<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiResult<String>>(value),
    );
  }
}

String _$locationNotifierHash() => r'd9e192ca4628c55fa13986cab25434f21d3922cc';

/// The device's current city. Locates on first watch; `ref.invalidate`
/// re-runs it (pull-to-refresh).

abstract class _$LocationNotifier extends $Notifier<ApiResult<String>> {
  ApiResult<String> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ApiResult<String>, ApiResult<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ApiResult<String>, ApiResult<String>>,
              ApiResult<String>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
