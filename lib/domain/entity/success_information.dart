// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app/application/states/credentials.dart';
import 'package:weather_app/domain/helper/extensions.dart';
import 'package:weather_app/infrastructure/Model/weather_model/weather_data.dart';

class SuccessInformation {
  final String? cityName;
  final String? temp;
  final String? condition;
  final String? dateTime;
  final String? imgUrl;
  final String? feelsLike;
  final String? description;

  SuccessInformation({
    this.cityName,
    this.temp,
    this.condition,
    this.dateTime,
    this.imgUrl,
    this.feelsLike,
    this.description,
  });

  factory SuccessInformation.fromWeatherData(WeatherData weatherData) {
    return SuccessInformation(
      cityName: weatherData.name,
      temp: weatherData.main?.temp?.toStringAsFixed(1),
      condition: weatherData.weather?.first.main,
      dateTime: weatherData.dt!.toFormattedTime,
      imgUrl: '$imgBaseUrl${weatherData.weather?.first.icon}@2x.png',
      feelsLike: weatherData.main?.feelsLike?.toStringAsFixed(1),
      description: weatherData.weather?.first.description,
    );
  }
}
