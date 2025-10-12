import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App theme configuration using FlexColorScheme for enhanced UI/UX
class AppTheme {
  // Private constructor to prevent instantiation
  const AppTheme._();

  /// Light theme configuration
  static ThemeData get light => FlexThemeData.light(
        // Use a weather-appropriate color scheme (Sky blue theme)
        scheme: FlexScheme.blueM3,
        
        // Enhanced surface blending for depth
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        
        // Custom font using Google Fonts
        fontFamily: GoogleFonts.inter().fontFamily,
        
        // Component theme configurations
        subThemesData: const FlexSubThemesData(
          // Enhanced component styling
          interactionEffects: true,
          tintedDisabledControls: true,
          
          // Card styling for weather cards
          cardElevation: 4,
          cardRadius: 16,
          
          // App bar styling
          appBarElevation: 2,
          appBarTransparent: true,
          
          // Button styling
          elevatedButtonRadius: 12,
          filledButtonRadius: 12,
          outlinedButtonRadius: 12,
          
          // Input decoration
          inputDecoratorRadius: 12,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          
          // Bottom sheet
          bottomSheetRadius: 20,
          
          // Dialog styling
          dialogRadius: 16,
          dialogElevation: 8,
          
          // Chip styling
          chipRadius: 8,
          
          // Navigation bar
          navigationBarElevation: 4,
          navigationBarHeight: 70,
          
          // Use Material 3 error colors
          useM3ErrorColors: true,
        ),
        
        // Visual density for better touch targets
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        
        // Use Material 3
        useMaterial3: true,
      );

  /// Dark theme configuration
  static ThemeData get dark => FlexThemeData.dark(
        // Use the same color scheme for consistency
        scheme: FlexScheme.blueM3,
        
        // Enhanced surface blending for depth in dark mode
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 12,
        
        // Custom font using Google Fonts
        fontFamily: GoogleFonts.inter().fontFamily,
        
        // Component theme configurations (same as light)
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          tintedDisabledControls: true,
          
          cardElevation: 4,
          cardRadius: 16,
          
          appBarElevation: 2,
          appBarTransparent: true,
          
          elevatedButtonRadius: 12,
          filledButtonRadius: 12,
          outlinedButtonRadius: 12,
          
          inputDecoratorRadius: 12,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          
          bottomSheetRadius: 20,
          
          dialogRadius: 16,
          dialogElevation: 8,
          
          chipRadius: 8,
          
          navigationBarElevation: 4,
          navigationBarHeight: 70,
          
          useM3ErrorColors: true,
        ),
        
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
      );

  /// Alternative weather-themed color scheme (Thunderstorm theme)
  static ThemeData get stormyLight => FlexThemeData.light(
        scheme: FlexScheme.deepPurple,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 9,
        fontFamily: GoogleFonts.inter().fontFamily,
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          cardElevation: 6,
          cardRadius: 16,
          appBarElevation: 2,
          appBarTransparent: true,
          elevatedButtonRadius: 12,
          inputDecoratorRadius: 12,
          bottomSheetRadius: 20,
          dialogRadius: 16,
          useM3ErrorColors: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
      );

  static ThemeData get stormyDark => FlexThemeData.dark(
        scheme: FlexScheme.deepPurple,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        fontFamily: GoogleFonts.inter().fontFamily,
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          cardElevation: 6,
          cardRadius: 16,
          appBarElevation: 2,
          appBarTransparent: true,
          elevatedButtonRadius: 12,
          inputDecoratorRadius: 12,
          bottomSheetRadius: 20,
          dialogRadius: 16,
          useM3ErrorColors: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
      );

  /// Sunny weather theme
  static ThemeData get sunnyLight => FlexThemeData.light(
        scheme: FlexScheme.amber,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 8,
        fontFamily: GoogleFonts.inter().fontFamily,
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          cardElevation: 4,
          cardRadius: 16,
          appBarElevation: 2,
          appBarTransparent: true,
          elevatedButtonRadius: 12,
          inputDecoratorRadius: 12,
          bottomSheetRadius: 20,
          dialogRadius: 16,
          useM3ErrorColors: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
      );

  static ThemeData get sunnyDark => FlexThemeData.dark(
        scheme: FlexScheme.amber,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 10,
        fontFamily: GoogleFonts.inter().fontFamily,
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          cardElevation: 4,
          cardRadius: 16,
          appBarElevation: 2,
          appBarTransparent: true,
          elevatedButtonRadius: 12,
          inputDecoratorRadius: 12,
          bottomSheetRadius: 20,
          dialogRadius: 16,
          useM3ErrorColors: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
      );
}

/// Theme mode enumeration
enum AppThemeMode {
  light,
  dark,
  system,
}

/// Theme variant enumeration for weather-based theming
enum WeatherThemeVariant {
  default_,  // Default blue theme
  stormy,    // Purple theme for storms
  sunny,     // Amber theme for sunny weather
}