import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/feature/common/providers.dart';

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
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        routerDelegate: ref.watch(appRouterProvider).delegate(),
        routeInformationParser:
            ref.watch(appRouterProvider).defaultRouteParser(),
      );
    });
  }
}
