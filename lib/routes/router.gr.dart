// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../presentation/Pages/DetailsPage.dart' as _i4;
import '../presentation/Pages/MyHomePage.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    MyHomePageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.MyHomePage();
        }),
    DetailsPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<DetailsPageRouteArgs>(
              orElse: () => const DetailsPageRouteArgs());
          return _i4.DetailsPage(key: args.key, cityName: args.cityName);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(MyHomePageRoute.name, path: '/'),
        _i1.RouteConfig(DetailsPageRoute.name, path: '/details-page')
      ];
}

class MyHomePageRoute extends _i1.PageRouteInfo {
  const MyHomePageRoute() : super(name, path: '/');

  static const String name = 'MyHomePageRoute';
}

class DetailsPageRoute extends _i1.PageRouteInfo<DetailsPageRouteArgs> {
  DetailsPageRoute({_i2.Key? key, String? cityName})
      : super(name,
            path: '/details-page',
            args: DetailsPageRouteArgs(key: key, cityName: cityName));

  static const String name = 'DetailsPageRoute';
}

class DetailsPageRouteArgs {
  const DetailsPageRouteArgs({this.key, this.cityName});

  final _i2.Key? key;

  final String? cityName;
}
