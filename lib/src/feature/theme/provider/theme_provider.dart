import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/src/core/theme/app_theme.dart';

part 'theme_provider.g.dart';

/// Theme state class to hold current theme configuration
class ThemeState {
  final AppThemeMode themeMode;
  final WeatherThemeVariant themeVariant;
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  const ThemeState({
    required this.themeMode,
    required this.themeVariant,
    required this.lightTheme,
    required this.darkTheme,
  });

  /// Get current theme mode for MaterialApp
  ThemeMode get materialThemeMode {
    switch (themeMode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }

  ThemeState copyWith({
    AppThemeMode? themeMode,
    WeatherThemeVariant? themeVariant,
    ThemeData? lightTheme,
    ThemeData? darkTheme,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      themeVariant: themeVariant ?? this.themeVariant,
      lightTheme: lightTheme ?? this.lightTheme,
      darkTheme: darkTheme ?? this.darkTheme,
    );
  }
}

/// Theme provider for managing app themes
@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeState build() {
    return ThemeState(
      themeMode: AppThemeMode.system,
      themeVariant: WeatherThemeVariant.default_,
      lightTheme: AppTheme.light,
      darkTheme: AppTheme.dark,
    );
  }

  /// Change theme mode (light, dark, system)
  void changeThemeMode(AppThemeMode mode) {
    state = state.copyWith(themeMode: mode);
  }

  /// Change theme variant based on weather condition
  void changeThemeVariant(WeatherThemeVariant variant) {
    final (lightTheme, darkTheme) = _getThemesForVariant(variant);
    
    state = state.copyWith(
      themeVariant: variant,
      lightTheme: lightTheme,
      darkTheme: darkTheme,
    );
  }

  /// Get themes based on variant
  (ThemeData, ThemeData) _getThemesForVariant(WeatherThemeVariant variant) {
    switch (variant) {
      case WeatherThemeVariant.default_:
        return (AppTheme.light, AppTheme.dark);
      case WeatherThemeVariant.stormy:
        return (AppTheme.stormyLight, AppTheme.stormyDark);
      case WeatherThemeVariant.sunny:
        return (AppTheme.sunnyLight, AppTheme.sunnyDark);
    }
  }

  /// Auto-switch theme based on weather condition
  void autoSwitchThemeForWeather(String weatherCondition) {
    final condition = weatherCondition.toLowerCase();
    
    WeatherThemeVariant variant = WeatherThemeVariant.default_;
    
    if (condition.contains('storm') || 
        condition.contains('thunder') ||
        condition.contains('rain') ||
        condition.contains('drizzle')) {
      variant = WeatherThemeVariant.stormy;
    } else if (condition.contains('clear') || 
               condition.contains('sunny') ||
               condition.contains('sun')) {
      variant = WeatherThemeVariant.sunny;
    }
    
    if (variant != state.themeVariant) {
      changeThemeVariant(variant);
    }
  }

  /// Toggle between light and dark mode
  void toggleThemeMode() {
    switch (state.themeMode) {
      case AppThemeMode.light:
        changeThemeMode(AppThemeMode.dark);
        break;
      case AppThemeMode.dark:
        changeThemeMode(AppThemeMode.system);
        break;
      case AppThemeMode.system:
        changeThemeMode(AppThemeMode.light);
        break;
    }
  }
}