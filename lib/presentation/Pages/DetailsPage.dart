import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
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
  void didChangeDependencies() {
    submitCityName(context, widget.cityName.toString());
    super.didChangeDependencies();
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
        body: Stack(
          children: [
            Container(
              height: height / 2,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/ClearDay.png',
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
                    Navigator.pop(context);
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
                    loading: () => CircularProgressIndicator(),
                    success: (data) => Container(
                      width: width,
                      height: height / 2.0,
                      child: buildSuccessInformation(
                        cityName: widget.cityName,
                        temp: data.main.temp!.toStringAsFixed(1),
                        condition: data.weather.single!.main.toString(),
                        dateTime: data.dt,
                      ),
                    ),
                    error: (e) => Text(
                      e.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
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
                padding: const EdgeInsets.only(left: 45),
                //   margin: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  color: Color(0xff8A8A8A),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
              ),
            ),
          ],
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

  Column buildSuccessInformation(
      {String? cityName, String? temp, String? condition, int? dateTime}) {
    return Column(
      children: [
        const SizedBox(height: 10),
        CircleAvatar(
          radius: 40,
        ),
        Text(
          cityName.toString(),
          style: bigTitleStyle.copyWith(fontSize: 36),
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
                  .format(DateTime.fromMillisecondsSinceEpoch(dateTime! * 1000))
                  .toString(),
              //dateTime.toString(),
              style: bigTitleStyle.copyWith(fontSize: 16),
            )
          ],
        ),
        Text(
          temp.toString() + "°",
          style: bigTitleStyle.copyWith(fontSize: 100),
        ),

        //
      ],
    );
  }
}
