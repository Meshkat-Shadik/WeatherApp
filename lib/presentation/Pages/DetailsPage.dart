import 'package:flutter/material.dart';
import 'package:weather_app/domain/entity/success_detail_information.dart';
import 'package:weather_app/domain/entity/success_information.dart';
import 'package:weather_app/infrastructure/Model/weather_model/weather_data.dart';
import 'package:weather_app/presentation/constants.dart';
import 'package:weather_app/presentation/widgets/success_detail_information_widget.dart';
import 'package:weather_app/presentation/widgets/success_information_widget.dart';
import 'package:weather_app/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsPage extends ConsumerWidget {
  final String? cityName;
  const DetailsPage({Key? key, this.cityName}) : super(key: key);

  void submitCityName(WidgetRef ref, String cityName) async {
    await ref.read(weatherProvider.notifier).getWeather(cityName);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final weatherState = ref.watch(weatherProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: RefreshIndicator(
          onRefresh: () async {
            return await ref
                .refresh(weatherProvider.notifier)
                .getWeather(cityName.toString());
          },
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: height / 2,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/images/ClearNight.png',
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.black54.withOpacity(0.0),
                            Colors.black45,
                          ],
                          stops: [
                            0.0,
                            0.5
                          ])),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.only(left: 4),
                    decoration: BoxDecoration(
                      color: Color(0xffe0e0e0),
                      boxShadow: backBtnBoxShadow,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
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
                    idle: () {
                      Future.delayed(
                        Duration.zero,
                        () => submitCityName(
                          ref,
                          cityName.toString(),
                        ),
                      );
                      return Container();
                    },
                    loading: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                    data: (data) => Container(
                      width: width,
                      height: height / 2.0,
                      child: BuildSuccessInformation(
                        key: GlobalObjectKey(cityName.toString()),
                        data: SuccessInformation.fromWeatherData(data),
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
                  top: height / 2,
                  child: Container(
                    height: height / 2,
                    width: width,
                    padding: const EdgeInsets.only(left: 45, top: 20),
                    decoration: BoxDecoration(
                      color: Color(0xff14141C),
                    ),
                    child: Column(
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
                          idle: () {
                            Future.delayed(
                              Duration.zero,
                              () => submitCityName(
                                ref,
                                cityName.toString(),
                              ),
                            );
                            return Container();
                          },
                          loading: () => Center(
                            child: CircularProgressIndicator(),
                          ),
                          data: (WeatherData weatherData) =>
                              BuildSuccessDetailInformation(
                            data: SuccessDetailInformation.fromWeatherData(
                              weatherData,
                            ),
                          ),
                          failed: (e) => Text(e.toString()),
                          orElse: () => Container(),
                        ),
                      ],
                    ),
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
