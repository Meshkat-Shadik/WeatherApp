import 'package:go_router/go_router.dart';
import 'package:weather_app/features/location/presentation/screens/initial_location_screen.dart';
import 'package:weather_app/features/weather/presentation/screens/weather_information_screen.dart';

enum AppRoute {
  location('/'),
  weather('/weather/:city');

  const AppRoute(this.path);
  final String path;
}

/// Navigation facade: screens call `AppRouter.pushWeather(city)`, never
/// `context.go` — every route change is greppable from this one file.
abstract final class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoute.location.path,
    routes: [
      GoRoute(
        path: AppRoute.location.path,
        name: AppRoute.location.name,
        builder: (_, _) => const InitialLocationScreen(),
      ),
      GoRoute(
        path: AppRoute.weather.path,
        name: AppRoute.weather.name,
        builder: (_, state) =>
            WeatherInformationScreen(city: state.pathParameters['city']!),
      ),
    ],
  );

  static void pushWeather(String city) =>
      router.pushNamed(AppRoute.weather.name, pathParameters: {'city': city});
}
