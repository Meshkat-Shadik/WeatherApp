import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/src/core/helper/extensions.dart';
import 'package:weather_app/src/feature/location/application/notifiers/location_notifier.dart';
import 'package:weather_app/src/feature/location/presentation/widgets/success_location_widget.dart';
import 'package:weather_app/src/feature/weather/application/providers.dart';
import 'package:weather_app/src/feature/weather/presentation/styles.dart';
import 'package:weather_app/src/routes/router.dart';

@RoutePage()
class InitialLocationScreen extends HookConsumerWidget {
  const InitialLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //calling the location provider at init
    //so that we can get the current location
    useEffect(
      () {
        //widgetBinding
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await ref.read(locationNotifierProvider.notifier).getMyLocation();
        });
        return null;
      },
      [],
    );

    //we are listening to the location provider
    //so that we can get the current location
    //it will call as soon as the app is opened
    //as we are using the location provider in the initial page
    final locationState = ref.watch(locationNotifierProvider);
    final cityNameController = useTextEditingController();

    return Stack(
      children: [
        Positioned(
          child: Container(
            width: double.infinity,
            height: context.height / 2,
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
            height: context.height / 2,
            width: context.width,
            color: dayShadowColor,
          ),
        ),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black54,
          body: RefreshIndicator(
            onRefresh: () async {
              //this will refresh the location api
              ref.invalidate(locationNotifierProvider);
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
                      SizedBox(height: context.height * 0.10),
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
                        controller: cityNameController,
                        style: TextStyle(color: Colors.white),
                        decoration: inputDecoration.copyWith(
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (cityNameController.text.isEmpty) return;
                              ref
                                  .watch(getCityNameProvider.notifier)
                                  .setCityName(
                                    cityNameController.text,
                                  );
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                context.router.push(
                                  WeatherInformationRoute(),
                                );
                              });
                            },
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: context.height * 0.2),
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
                              data: (cityName) {
                                return BuildSucessLocation(cityName: cityName);
                              },
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
