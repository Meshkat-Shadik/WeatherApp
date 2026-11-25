/// Asset paths. Widgets take an `ImageProvider` rather than a path, so a host
/// such as the widgetbook can resolve them with `package: 'weather_app'`.
abstract final class AppAssets {
  static const day = 'assets/images/day.jpg';
  static const night = 'assets/images/night.jpg';
  static const clearDay = 'assets/images/ClearDay.png';
}
