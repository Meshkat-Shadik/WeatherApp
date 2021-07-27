import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/api/credentials.dart';
import 'package:weather_app/presentation/constants.dart';
import 'package:weather_app/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsPage extends StatefulWidget {
  static const String pathId = '/detailsPage';
  final String? cityName;
  const DetailsPage({Key? key, this.cityName}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero,
        () => submitCityName(context, widget.cityName.toString()));
    super.initState();
  }

  void submitCityName(BuildContext context, String cityName) async {
    await context
        .read(weatherStateNotifierProvider.notifier)
        .getWeather(cityName);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: RefreshIndicator(
          onRefresh: () async {
            return await context
                .read(weatherStateNotifierProvider.notifier)
                .getWeather(widget.cityName.toString());
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
                            ?.addPostFrameCallback((timeStamp) {
                          Navigator.pop(context);
                        });
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
                Positioned(
                  child: Consumer(
                    builder: (context, watch, child) {
                      final weatherState = watch(weatherStateNotifierProvider);
                      return weatherState.maybeWhen(
                        loading: () => Container(),
                        success: (data) => Container(
                          width: width,
                          height: height / 2.0,
                          child: BuildSuccessInformation(
                            key: GlobalObjectKey(widget.cityName.toString()),
                            cityName: widget.cityName ?? "Null",
                            temp: data.main?.temp?.toStringAsFixed(1) ?? "0",
                            condition:
                                data.weather?.last.main.toString() ?? "Null",
                            dateTime: data.dt ?? 1,
                            imgUrl:
                                '$imgBaseUrl${data.weather?.last.icon}@2x.png',
                            feelsLike:
                                data.main?.feelsLike?.toStringAsFixed(1) ?? "",
                            description: data.weather?.last.description ?? "0",
                          ),
                        ),
                        error: (e) {
                          // showInSnackBar(e.toString(), "", () {
                          //   Navigator.pop(context);
                          // });

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
                      );
                    },
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
                        Consumer(
                          builder: (context, watch, child) {
                            final weatherState =
                                watch(weatherStateNotifierProvider);
                            return weatherState.maybeWhen(
                              loading: () => Container(),
                              success: (weatherData) =>
                                  BuildSuccessDetailInformation(
                                gustValue: weatherData.wind?.gust.toString() ??
                                    weatherData.wind?.speed.toString(),
                                humidityValue:
                                    weatherData.main?.humidity.toString(),
                                pressureValue:
                                    weatherData.main?.pressure.toString(),
                                windValue: weatherData.wind?.speed.toString(),
                                sunriseValue: weatherData.sys?.sunrise,
                                sunsetValue: weatherData.sys?.sunset,
                              ),
                              error: (e) => Text(e.toString()),
                              orElse: () => Container(),
                            );
                          },
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
    // return Column(
    //   children: [
    //     Container(
    //       height: height / 1.5,
    //       width: double.infinity,
    //       child: Image.asset(
    //         'assets/images/night.jpg',
    //         fit: BoxFit.fill,
    //       ),
    //     ),
    //     Container(
    //       height: height / 0.1,
    //       child: Image.asset(
    //         'assets/images/night.jpg',
    //         fit: BoxFit.fill,
    //       ),
    //     ),
    //   ],
    // );
  }
}

class BuildSuccessDetailInformation extends StatelessWidget {
  const BuildSuccessDetailInformation({
    this.windValue,
    this.gustValue,
    this.pressureValue,
    this.humidityValue,
    this.sunriseValue,
    this.sunsetValue,
    Key? key,
  }) : super(key: key);

  final String? windValue, humidityValue, gustValue, pressureValue;
  final int? sunriseValue, sunsetValue;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        physics: BouncingScrollPhysics(),
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          DetailBlock(
            icon: Icon(Icons.air_outlined, size: 36),
            title: "Wind",
            value: windValue,
            unit: "m/s",
            color: Colors.amber[100],
          ),
          DetailBlock(
            icon: Icon(Icons.opacity, size: 36),
            title: "Humidity",
            value: '$humidityValue %',
            color: Colors.amber[200],
          ),
          DetailBlock(
            icon: Icon(Icons.fast_forward, size: 36),
            title: "Gust",
            unit: "m/s",
            value: gustValue,
            color: Colors.amber[300],
          ),
          DetailBlock(
            icon: Icon(Icons.speed, size: 36),
            title: "Pressure",
            unit: "hPa",
            value: pressureValue,
            color: Colors.amber[400],
          ),
          DetailBlock(
            icon: Icon(Icons.brightness_7, size: 36),
            title: "Sunrise",
            value: DateFormat('hh:mm a')
                .format(
                    DateTime.fromMillisecondsSinceEpoch(sunriseValue! * 1000))
                .toString(),
            color: Colors.amber[500],
          ),
          DetailBlock(
            icon: Icon(Icons.brightness_3, size: 36),
            title: "Sunset",
            value: DateFormat('hh:mm a')
                .format(
                    DateTime.fromMillisecondsSinceEpoch(sunsetValue! * 1000))
                .toString(),
            color: Colors.amber[600],
          ),
        ],
      ),
    );
  }
}

class DetailBlock extends StatelessWidget {
  const DetailBlock({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
    this.unit,
  }) : super(key: key);

  final Icon? icon;
  final String? title;
  final String? value;
  final Color? color;
  final String? unit;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? Container(),
          Text(
            title ?? "",
            style: weatherDetailsTextStyle.copyWith(fontSize: 18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textBaseline: TextBaseline.ideographic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                value ?? "",
                style: weatherDetailsTextStyle.copyWith(
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 5),
              Text(
                unit ?? "",
                style: weatherDetailsTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
      color: color,
    );
  }
}

class BuildSuccessInformation extends StatelessWidget {
  const BuildSuccessInformation({
    Key? key,
    required this.cityName,
    this.temp,
    this.condition,
    this.imgUrl,
    required this.dateTime,
    this.feelsLike,
    this.description,
  }) : super(key: key);
  final String? cityName, temp, condition, imgUrl, feelsLike, description;
  final int dateTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.transparent,
          backgroundImage:
              NetworkImage(imgUrl ?? "http://via.placeholder.com/200x150"),
        ),
        Text(
          cityName.toString(),
          style: bigTitleStyle.copyWith(fontSize: 38),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$condition, ',
              style: bigTitleStyle.copyWith(fontSize: 16),
            ),
            Text(
              DateFormat('hh:mm a')
                  .format(DateTime.fromMillisecondsSinceEpoch(dateTime * 1000))
                  .toString(),
              //dateTime.toString(),
              style: bigTitleStyle.copyWith(fontSize: 18),
            )
          ],
        ),
        Text(
          description ?? "",
          style: bigTitleStyle.copyWith(fontSize: 16),
        ),
        Text(
          temp.toString() + "°",
          style: bigTitleStyle.copyWith(fontSize: 100),
        ),
        Text(
          "Feels Like : " + feelsLike.toString() + "°",
          style: bigTitleStyle.copyWith(fontSize: 16),
        )
        //
      ],
    );
  }
}
