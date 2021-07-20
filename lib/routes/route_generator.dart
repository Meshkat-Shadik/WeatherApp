import 'package:flutter/material.dart';
import 'package:weather_app/presentation/Pages/DetailsPage.dart';
import 'package:weather_app/presentation/Pages/MyHomePage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;
    switch (settings.name) {
      case MyHomePage.pathId:
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case DetailsPage.pathId:
        return MaterialPageRoute(builder: (_) => DetailsPage(cityName:args));
      //  builder: (_) => DetailsPage(weatherData: args));
      // case CityScreen.pathId:
      //   return MaterialPageRoute(builder: (_) => CityScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text('ERROR'), backgroundColor: Colors.red),
        body: Center(child: Text('ERROR')),
      );
    });
  }
}
