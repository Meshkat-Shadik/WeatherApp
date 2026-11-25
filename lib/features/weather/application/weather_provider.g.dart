// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Weather for one city — a family keyed by the city in the route, so the
/// screen needs no "selected city" provider set before navigating.

@ProviderFor(WeatherNotifier)
final weatherProvider = WeatherNotifierFamily._();

/// Weather for one city — a family keyed by the city in the route, so the
/// screen needs no "selected city" provider set before navigating.
final class WeatherNotifierProvider
    extends $NotifierProvider<WeatherNotifier, ApiResult<WeatherEntity>> {
  /// Weather for one city — a family keyed by the city in the route, so the
  /// screen needs no "selected city" provider set before navigating.
  WeatherNotifierProvider._({
    required WeatherNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'weatherProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$weatherNotifierHash();

  @override
  String toString() {
    return r'weatherProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WeatherNotifier create() => WeatherNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiResult<WeatherEntity> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiResult<WeatherEntity>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WeatherNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$weatherNotifierHash() => r'c71e27478607eee55ab064057c35af5ce7a09850';

/// Weather for one city — a family keyed by the city in the route, so the
/// screen needs no "selected city" provider set before navigating.

final class WeatherNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          WeatherNotifier,
          ApiResult<WeatherEntity>,
          ApiResult<WeatherEntity>,
          ApiResult<WeatherEntity>,
          String
        > {
  WeatherNotifierFamily._()
    : super(
        retry: null,
        name: r'weatherProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Weather for one city — a family keyed by the city in the route, so the
  /// screen needs no "selected city" provider set before navigating.

  WeatherNotifierProvider call(String city) =>
      WeatherNotifierProvider._(argument: city, from: this);

  @override
  String toString() => r'weatherProvider';
}

/// Weather for one city — a family keyed by the city in the route, so the
/// screen needs no "selected city" provider set before navigating.

abstract class _$WeatherNotifier extends $Notifier<ApiResult<WeatherEntity>> {
  late final _$args = ref.$arg as String;
  String get city => _$args;

  ApiResult<WeatherEntity> build(String city);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<ApiResult<WeatherEntity>, ApiResult<WeatherEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ApiResult<WeatherEntity>, ApiResult<WeatherEntity>>,
              ApiResult<WeatherEntity>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
