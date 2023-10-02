import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/feature/weather/application/providers.dart';
import 'package:weather_app/feature/weather/domain/entity/weather_basic_entity.dart';
import 'package:weather_app/feature/weather/domain/entity/weather_detail_entity.dart';
import 'package:weather_app/feature/weather/domain/entity/weather_full_entity.dart';
import 'package:weather_app/feature/weather/presentation/styles.dart';
import 'package:weather_app/feature/weather/presentation/widgets/details_weather_information.dart';
import 'package:weather_app/feature/weather/presentation/widgets/basic_weather_information.dart';
import 'package:weather_app/helper/extensions.dart';

@RoutePage()
class WeatherInformationScreen extends ConsumerWidget {
  const WeatherInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //we are reading the city name from the provider
    final cityName = ref.watch(cityNameProvider);
    //as soon as the page is opened we are calling the weather api with the city name that is mutated from the previous page
    final weatherState = ref.watch(weatherProvider(cityName));
    final isSuccessful = weatherState.maybeWhen(
      data: (data) => true,
      orElse: () => false,
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: RefreshIndicator(
          onRefresh: () async {
            return await ref
                .refresh(weatherProvider(cityName).notifier)
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
                                data: (WeatherFullEntity weatherData) =>
                                    DetailsWeatherInformation(
                                  data: WeatherDetailEntity.fromFullEntity(
                                    weatherData,
                                  ),
                                ),
                                failed: (e) => Text(e.toString()),
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
