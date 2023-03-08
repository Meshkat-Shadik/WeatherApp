import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/presentation/constants.dart';
import 'package:weather_app/providers.dart';
import 'package:weather_app/presentation/routes/router.gr.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(locationProvider.notifier).getMyLocation();
    });
  }

  final cityTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final locationState = ref.watch(locationProvider);

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
          body: RefreshIndicator(
            onRefresh: () async {
              return await ref
                  .refresh(locationProvider.notifier)
                  .getMyLocation();
            },
            child: ListView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.10),
                      Text(
                        "Hello there!",
                        style: GoogleFonts.raleway(
                            fontSize: 32, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Check the weather by the city",
                        style: GoogleFonts.raleway(
                            fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: cityTextController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: outlineInputBorder,
                          enabledBorder: outlineInputBorder,
                          focusedBorder: outlineInputBorder,
                          hintText: "Enter the city name",
                          hintStyle: hintTextStyle,
                          suffixIcon: IconButton(
                            onPressed: () {
                              context.router.push(
                                DetailsPageRoute(
                                  cityName: cityTextController.text.trim(),
                                ),
                              );
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
                              loading: () => CircularProgressIndicator(),
                              data: (cityName) =>
                                  buildSuccessLocation(cityName, context),
                              failed: (e) => Text(
                                e.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              orElse: () => CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.router.push(DetailsPageRoute(cityName: cityName));
          });
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white10, padding: EdgeInsets.all(15)),
      ),
    ],
  );
}
