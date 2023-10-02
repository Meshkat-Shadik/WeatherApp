import 'package:flutter/material.dart';
import 'package:weather_app/feature/weather/domain/entity/weather_basic_entity.dart';
import 'package:weather_app/feature/weather/presentation/styles.dart';

class BasicWeatherInformation extends StatelessWidget {
  const BasicWeatherInformation({
    Key? key,
    required this.data,
  }) : super(key: key);

  final WeatherBasicEntity data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.transparent,
          backgroundImage:
              NetworkImage(data.imgUrl ?? "http://via.placeholder.com/200x150"),
        ),
        Text(
          data.cityName.toString(),
          style: bigTitleStyle.copyWith(fontSize: 38),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${data.condition}, ',
              style: bigTitleStyle.copyWith(fontSize: 16),
            ),
            Text(
              data.dateTime ?? "",
              style: bigTitleStyle.copyWith(fontSize: 18),
            )
          ],
        ),
        Text(
          data.description ?? "",
          style: bigTitleStyle.copyWith(fontSize: 16),
        ),
        Text(
          data.temp.toString() + "°",
          style: bigTitleStyle.copyWith(fontSize: 100),
        ),
        Text(
          "Feels Like : " + data.feelsLike.toString() + "°",
          style: bigTitleStyle.copyWith(fontSize: 16),
        )
        //
      ],
    );
  }
}
