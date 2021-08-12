import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/routes/router.gr.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // primaryColor: Color(0xff262431),
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   void submitCityName(BuildContext context, String cityName) {
//     context.read(weatherStateNotifierProvider.notifier).getWeather(cityName);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("CHECK"),
//       ),
//       body: Consumer(
//         builder: (context, watch, child) {
//           final weatherState = watch(weatherStateNotifierProvider);

//           return weatherState.maybeWhen(
//             loading: () => CircularProgressIndicator(),
//             success: (data) => Center(
//               // child: Text(data.toString()),
//               child: ListTile(
//                 title: Text(data.name),
//                 subtitle: Text(data.main.temp.toString()),
//                 leading: CircleAvatar(
//                   child: Image.network(
//                       '$imgBaseUrl${data.weather[0]!.icon}@2x.png'),
//                 ),
//               ),
//             ),
//             error: (e) => Center(
//               child: Text("Error occurred, $e"),
//             ),
//             orElse: () => Center(
//               child: ElevatedButton(
//                   child: Text(
//                     "Get Single User",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onPressed: () {
//                     submitCityName(context, "KHulna");
//                   }),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
