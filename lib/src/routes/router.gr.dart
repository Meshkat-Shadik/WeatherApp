// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [InitialLocationScreen]
class InitialLocationRoute extends PageRouteInfo<void> {
  const InitialLocationRoute({List<PageRouteInfo>? children})
      : super(
          InitialLocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialLocationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const InitialLocationScreen();
    },
  );
}

/// generated route for
/// [WeatherInformationScreen]
class WeatherInformationRoute extends PageRouteInfo<void> {
  const WeatherInformationRoute({List<PageRouteInfo>? children})
      : super(
          WeatherInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeatherInformationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WeatherInformationScreen();
    },
  );
}
