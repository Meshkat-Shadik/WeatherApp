// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    InitialLocationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InitialLocationScreen(),
      );
    },
    WeatherInformationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WeatherInformationScreen(),
      );
    },
  };
}

/// generated route for
/// [InitialLocationScreen]
class InitialLocationRoute extends PageRouteInfo<void> {
  const InitialLocationRoute({List<PageRouteInfo>? children})
      : super(
          InitialLocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialLocationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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

  static const PageInfo<void> page = PageInfo<void>(name);
}
