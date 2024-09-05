import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:weather_app/src/core/failure/failure_handler.dart';
import 'package:weather_app/src/core/helper/extensions.dart';
import 'package:weather_app/src/feature/weather/application/notifiers/weather_notifier.dart';
import 'package:weather_app/src/feature/weather/application/providers.dart';
import 'package:weather_app/src/feature/weather/domain/entity/weather_basic_entity.dart';
import 'package:weather_app/src/feature/weather/domain/entity/weather_detail_entity.dart';
import 'package:weather_app/src/feature/weather/presentation/styles.dart';
import 'package:weather_app/src/feature/weather/presentation/widgets/basic_weather_information.dart';
import 'package:weather_app/src/feature/weather/presentation/widgets/details_weather_information.dart';

@RoutePage()
class WeatherInformationScreen extends HookConsumerWidget {
  const WeatherInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //we are reading the city name from the provider
    final cityName = ref.watch(getCityNameProvider);

    //calling the location provider at init
    //so that we can get the current location
    useEffect(
      () {
        //widgetBinding
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await ref.read(weatherNotifierProvider.notifier).getWeather(cityName);
        });
        return null;
      },
      [],
    );

    final weatherState = ref.watch(weatherNotifierProvider);
    final isSuccessful = weatherState.maybeWhen(
      data: (data) => true,
      orElse: () => false,
    );

    FailureHandler.listenForErrors(
      ref,
      weatherNotifierProvider,
      context,
      () async {
        await ref.read(weatherNotifierProvider.notifier).getWeather(cityName);
      },
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: RefreshIndicator(
          onRefresh: () async {
            return await ref
                .refresh(weatherNotifierProvider.notifier)
                .getWeather(cityName);
          },
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: context.height / 2,
                  decoration: detailsBgDecoration,
                ),
                Container(
                  height: context.height,
                  decoration: detailsBgDecorationWithGradient,
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.only(left: 4),
                    decoration: backButtonDecoration,
                    child: IconButton(
                      onPressed: () {
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          Navigator.pop(context);
                        });
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
                Positioned(
                  child: weatherState.maybeWhen(
                    loading: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                    data: (data) => Container(
                      width: context.width,
                      height: context.height / 2.0,
                      child: BasicWeatherInformation(
                        key: GlobalObjectKey(
                          cityName.toString(),
                        ),
                        data: WeatherBasicEntity.fromFullEntity(data),
                      ),
                    ),
                    failed: (e) {
                      return Container(
                        margin: EdgeInsets.only(top: 140),
                        alignment: Alignment.center,
                        child: Text(
                          e.toString(),
                          style: bigTitleStyle,
                        ),
                      );
                    },
                    orElse: () => CircularProgressIndicator(),
                  ),
                ),
                Positioned(
                  top: context.height / 2,
                  child: Container(
                    height: context.height / 2,
                    width: context.width,
                    padding: const EdgeInsets.only(left: 45, top: 20),
                    decoration: BoxDecoration(
                      color: Color(0xff14141C),
                    ),
                    child: isSuccessful
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.white,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Weather Details",
                                    style: bigTitleStyle.copyWith(fontSize: 16),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              weatherState.maybeWhen(
                                loading: () => Center(
                                  child: CircularProgressIndicator(),
                                ),
                                data: (weatherData) {
                                  final weatherDetail =
                                      WeatherDetailEntity.fromFullEntity(
                                    weatherData,
                                  );
                                  return DetailsWeatherInformation(
                                      data: weatherDetail);
                                },
                                failed: (e) => Text('${e.code} : ${e.message}'),
                                orElse: () => Container(),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
