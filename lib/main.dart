import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/feature/common/providers.dart';
import 'package:weather_app/src/feature/theme/provider/theme_provider.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      // Watch theme state for reactive theme changes
      final themeState = ref.watch(themeNotifierProvider);
      
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        
        // Use FlexColorScheme themes
        theme: themeState.lightTheme,
        darkTheme: themeState.darkTheme,
        themeMode: themeState.materialThemeMode,
        
        // Router configuration
        routerDelegate: ref.watch(appRouterProvider).delegate(),
        routeInformationParser:
            ref.watch(appRouterProvider).defaultRouteParser(),
      );
    });
  }
}