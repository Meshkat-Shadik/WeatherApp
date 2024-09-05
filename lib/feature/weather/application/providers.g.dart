// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getWeatherRepositoryHash() =>
    r'1db0fbf80dc0d73a682663a21e45f3aad4db64f8';

/// See also [getWeatherRepository].
@ProviderFor(getWeatherRepository)
final getWeatherRepositoryProvider =
    AutoDisposeProvider<WeatherRepository>.internal(
  getWeatherRepository,
  name: r'getWeatherRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getWeatherRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetWeatherRepositoryRef = AutoDisposeProviderRef<WeatherRepository>;
String _$getCityNameHash() => r'26a8657e4ea2a363fa612b14fafd8825d3584aa2';

/// See also [GetCityName].
@ProviderFor(GetCityName)
final getCityNameProvider =
    AutoDisposeNotifierProvider<GetCityName, String>.internal(
  GetCityName.new,
  name: r'getCityNameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getCityNameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetCityName = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
