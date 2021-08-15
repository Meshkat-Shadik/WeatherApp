import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/presentation/constants.dart';
import 'package:weather_app/providers.dart';
import 'package:weather_app/routes/router.gr.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void getInitLocation(BuildContext context) async {
    await context.read(locationStateNotifierProvider.notifier).getMyLocation();
  }

  void updateCityName(BuildContext context, String email) {
    context.read(cityNameProvider).state = email;
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final locationState = watch(locationStateNotifierProvider);
    final cityName = watch(cityNameProvider).state;

    return Stack(
      children: [
        Positioned(
          child: Container(
            width: double.infinity,
            height: height / 2,
            child: Image.asset(
              'assets/images/day.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: height / 2,
            width: width,
            color: dayShadowColor,
          ),
        ),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black54,
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.10),
                Text(
                  "Hello there!",
                  style: GoogleFonts.raleway(fontSize: 32, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  "Check the weather by the city",
                  style: GoogleFonts.raleway(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 20),
                TextField(
                  onChanged: (value) => updateCityName(context, value),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: outlineInputBorder,
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                    hintText: "Enter the city name",
                    hintStyle: hintTextStyle,
                    suffixIcon: IconButton(
                      onPressed: () {
                        context.router
                            .push(DetailsPageRoute(cityName: cityName));
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.2),
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You are in ",
                        style: GoogleFonts.raleway(
                            fontSize: 16, color: Colors.white),
                      ),
                      locationState.maybeWhen(
                        initial: () {
                          Future.delayed(
                              Duration.zero, () => getInitLocation(context));
                          return CircularProgressIndicator();
                        },
                        loading: () => CircularProgressIndicator(),
                        success: (cityName) =>
                            buildSuccessLocation(cityName, context),
                        error: (e) => Text(
                          e.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        orElse: () => CircularProgressIndicator(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

Widget buildSuccessLocation(String cityName, BuildContext context) {
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
          WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
            context.router.push(DetailsPageRoute(cityName: cityName));
          });
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.white10, padding: EdgeInsets.all(15)),
      ),
    ],
  );
}
