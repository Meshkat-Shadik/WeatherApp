# 🎨 FlexColorScheme Theming Guide

This guide explains the enhanced theming system implemented using [FlexColorScheme](https://pub.dev/packages/flex_color_scheme) in the WeatherApp.

## 🌟 Features

### Dynamic Weather-Based Theming
- **Automatic theme switching** based on weather conditions
- **Multiple theme variants**: Default (Blue), Stormy (Purple), Sunny (Amber)
- **Material 3 design** with enhanced color schemes

### Advanced Theming Capabilities
- **Surface blending** for depth and modern appearance
- **Consistent component theming** across all UI elements
- **Custom typography** using Google Fonts (Inter)
- **Responsive design** with proper visual density

### User Controls
- **Theme mode switching**: Light, Dark, System
- **Manual theme variant selection**
- **Theme settings widget** for user preferences

## 🏗️ Architecture

### Theme Configuration (`app_theme.dart`)
```dart
class AppTheme {
  static ThemeData get light => FlexThemeData.light(
    scheme: FlexScheme.blueM3,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    fontFamily: GoogleFonts.inter().fontFamily,
    // ... component configurations
  );
}
```

### Theme Management (`theme_provider.dart`)
- **Riverpod state management** for reactive theme changes
- **Automatic weather detection** and theme switching
- **Persistent theme preferences** (can be extended with storage)

### Weather-Responsive Theming
The app automatically switches themes based on weather conditions:

| Weather Condition | Theme Variant | Color Scheme |
|-------------------|---------------|-------------|
| Clear/Sunny | Sunny | Warm Amber |
| Rain/Storm/Thunder | Stormy | Deep Purple |
| General/Cloudy | Default | Cool Blue |

## 📱 UI Components

### Enhanced Weather Card
- **Gradient backgrounds** using theme colors
- **Adaptive icons** based on weather conditions
- **Information chips** for weather details
- **Material 3 elevation** and shadows

### Theme Settings Widget
- **Interactive theme switching**
- **Visual theme mode indicators**
- **Weather theme explanations**
- **Real-time preview** of changes

## 🎯 Key Improvements

### Visual Enhancements
1. **Consistent Design Language**: All components follow Material 3 guidelines
2. **Enhanced Depth**: Surface blending creates visual hierarchy
3. **Better Contrast**: Improved readability in all lighting conditions
4. **Smooth Transitions**: Animated theme changes for better UX

### User Experience
1. **Contextual Theming**: Weather-appropriate color schemes
2. **Accessibility**: High contrast ratios and proper touch targets
3. **Customization**: User control over theme preferences
4. **Consistency**: Unified theming across the entire app

## 🔧 Implementation Details

### FlexColorScheme Configuration
```dart
FlexThemeData.light(
  scheme: FlexScheme.blueM3,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 7,
  subThemesData: const FlexSubThemesData(
    cardElevation: 4,
    cardRadius: 16,
    elevatedButtonRadius: 12,
    inputDecoratorRadius: 12,
    // ... more configurations
  ),
  useMaterial3: true,
)
```

### Theme Provider Integration
```dart
@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  void autoSwitchThemeForWeather(String weatherCondition) {
    // Automatic theme switching logic
  }
}
```

## 🚀 Usage Examples

### Basic Theme Integration
```dart
class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final themeState = ref.watch(themeNotifierProvider);
      
      return MaterialApp.router(
        theme: themeState.lightTheme,
        darkTheme: themeState.darkTheme,
        themeMode: themeState.materialThemeMode,
        // ...
      );
    });
  }
}
```

### Weather-Based Theme Switching
```dart
// Automatic switching in weather widgets
WidgetsBinding.instance.addPostFrameCallback((_) {
  ref.read(themeNotifierProvider.notifier)
    .autoSwitchThemeForWeather(weatherCondition);
});
```

### Manual Theme Control
```dart
// In settings or theme selector
ref.read(themeNotifierProvider.notifier)
  .changeThemeVariant(WeatherThemeVariant.stormy);
```

## 🎨 Color Schemes

### Default Theme (Blue M3)
- **Primary**: Material 3 Blue
- **Use Case**: General weather conditions
- **Mood**: Professional, reliable

### Stormy Theme (Deep Purple)
- **Primary**: Deep Purple shades
- **Use Case**: Rain, thunderstorms, severe weather
- **Mood**: Dramatic, powerful

### Sunny Theme (Amber)
- **Primary**: Warm amber tones
- **Use Case**: Clear skies, sunny weather
- **Mood**: Cheerful, energetic

## 🔮 Future Enhancements

1. **Seasonal Themes**: Different color schemes for seasons
2. **Custom Color Schemes**: User-defined color palettes
3. **Animation Themes**: Weather-appropriate animations
4. **Accessibility Themes**: High contrast and colorblind-friendly options
5. **Time-based Theming**: Different themes for day/night

## 📚 Resources

- [FlexColorScheme Documentation](https://docs.flexcolorscheme.com/)
- [Material 3 Design System](https://m3.material.io/)
- [Flutter Theming Guide](https://docs.flutter.dev/ui/design/themes)
- [Riverpod State Management](https://riverpod.dev/)

## 🤝 Contributing

When contributing to the theming system:

1. **Follow Material 3 guidelines**
2. **Test in both light and dark modes**
3. **Ensure accessibility compliance**
4. **Document new theme variants**
5. **Test with different weather conditions**

---

**Note**: This theming system is designed to be extensible. New weather conditions, color schemes, and user preferences can be easily added by following the established patterns.