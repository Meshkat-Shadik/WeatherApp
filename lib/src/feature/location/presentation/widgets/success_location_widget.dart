import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/src/feature/weather/application/providers.dart';
import 'package:weather_app/src/feature/weather/presentation/styles.dart';
import 'package:weather_app/src/routes/router.dart';

class BuildSucessLocation extends ConsumerWidget {
  final String cityName;

  const BuildSucessLocation({
    super.key,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(cityName, style: bigTitleStyle.copyWith(fontSize: 25)),
        const SizedBox(height: 20),
        ElevatedButton(
          child: Text(
            'Tap to see more!',
            style: TextStyle(color: Colors.white54),
          ),
          onPressed: () {
            //we are setting the city name in the provider and then pushing the route
            //later we will use this city name to fetch the weather data
            ref.read(getCityNameProvider.notifier).setCityName(cityName);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.router.push(WeatherInformationRoute());
            });
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white10, padding: EdgeInsets.all(15)),
        ),
      ],
    );
  }
}
