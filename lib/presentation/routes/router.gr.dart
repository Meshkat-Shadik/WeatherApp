// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../Pages/DetailsPage.dart' as _i2;
import '../Pages/MyHomePage.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MyHomePageRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MyHomePage(),
      );
    },
    DetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsPageRouteArgs>(
          orElse: () => const DetailsPageRouteArgs());
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.DetailsPage(
          key: args.key,
          cityName: args.cityName,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          MyHomePageRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          DetailsPageRoute.name,
          path: '/details-page',
        ),
      ];
}

/// generated route for
/// [_i1.MyHomePage]
class MyHomePageRoute extends _i3.PageRouteInfo<void> {
  const MyHomePageRoute()
      : super(
          MyHomePageRoute.name,
          path: '/',
        );

  static const String name = 'MyHomePageRoute';
}

/// generated route for
/// [_i2.DetailsPage]
class DetailsPageRoute extends _i3.PageRouteInfo<DetailsPageRouteArgs> {
  DetailsPageRoute({
    _i4.Key? key,
    String? cityName,
  }) : super(
          DetailsPageRoute.name,
          path: '/details-page',
          args: DetailsPageRouteArgs(
            key: key,
            cityName: cityName,
          ),
        );

  static const String name = 'DetailsPageRoute';
}

class DetailsPageRouteArgs {
  const DetailsPageRouteArgs({
    this.key,
    this.cityName,
  });

  final _i4.Key? key;

  final String? cityName;

  @override
  String toString() {
    return 'DetailsPageRouteArgs{key: $key, cityName: $cityName}';
  }
}
