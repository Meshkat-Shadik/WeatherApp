import 'package:weather_app/domain/helper/extensions.dart';
import 'package:weather_app/infrastructure/Model/weather_model/weather_data.dart';

class SuccessDetailInformation {
  final String? windValue;
  final String? humidityValue;
  final String? gustValue;
  final String? pressureValue;
  final String? sunriseValue;
  final String? sunsetValue;
  SuccessDetailInformation({
    this.windValue,
    this.humidityValue,
    this.gustValue,
    this.pressureValue,
    this.sunriseValue,
    this.sunsetValue,
  });

  factory SuccessDetailInformation.fromWeatherData(WeatherData weatherData) {
    return SuccessDetailInformation(
      windValue: weatherData.wind?.speed.toString(),
      humidityValue: weatherData.main?.humidity.toString(),
      gustValue: weatherData.wind?.gust.toString(),
      pressureValue: weatherData.main?.pressure.toString(),
      sunriseValue: (weatherData.sys?.sunrise! ?? 0).toFormattedTime,
      sunsetValue: (weatherData.sys?.sunset! ?? 0).toFormattedTime,
    );
  }
}
