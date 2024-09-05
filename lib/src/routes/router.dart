import 'package:auto_route/auto_route.dart';
import 'package:weather_app/src/feature/location/presentation/screen/initial_location_screen.dart';
import 'package:weather_app/src/feature/weather/presentation/screen/weather_infromation_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.adaptive(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: InitialLocationRoute.page, initial: true),
        AutoRoute(page: WeatherInformationRoute.page),
      ];
}
