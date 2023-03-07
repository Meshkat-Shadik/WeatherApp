import 'package:auto_route/auto_route.dart';
import 'package:weather_app/presentation/Pages/DetailsPage.dart';
import 'package:weather_app/presentation/Pages/MyHomePage.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: MyHomePage, initial: true),
    AutoRoute(page: DetailsPage),
  ],
)
class $AppRouter {}
