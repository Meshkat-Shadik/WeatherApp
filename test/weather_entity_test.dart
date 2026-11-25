import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/weather/data/dto/weather_dto.dart';
import 'package:weather_app/features/weather/data/entities/weather_entity.dart';

void main() {
  test('OpenWeather JSON parses into a WeatherEntity', () {
    final dto = WeatherDto.fromJson({
      'weather': [
        {'main': 'Clouds', 'description': 'broken clouds', 'icon': '04d'},
      ],
      'main': {
        'temp': 30,
        'feels_like': 35.2,
        'pressure': 1006,
        'humidity': 70,
      },
      'wind': {'speed': 3.6},
      'dt': 1700000000,
      'sys': {'sunrise': 1699990000, 'sunset': 1700030000},
      'name': 'Dhaka',
      'cod': 200,
    });
    final w = WeatherEntity.fromDto(dto);

    expect(w.cityName, 'Dhaka');
    expect(w.temperature, 30.0); // int on the wire
    expect(w.feelsLike, 35.2); // snake_case key
    expect(w.windGust, isNull); // optional in the API
    expect(w.iconUrl, endsWith('04d@2x.png'));
    expect(
      w.observedAt,
      DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000),
    );
    expect(dto.cod, '200');
    expect(w.copyWith(cityName: 'Khulna').cityName, 'Khulna');
  });
}
