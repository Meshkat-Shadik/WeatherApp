import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:weather_app/core/router/app_router.dart';
import 'package:weather_app/design_system/design_system.dart';

void main() => runApp(const ProviderScope(child: WeatherApp()));

class const WeatherApp({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'Weather',
    debugShowCheckedModeBanner: false,
    theme: AppTheme.light(),
    darkTheme: AppTheme.dark(),
    routerConfig: AppRouter.router,
  );
}
