import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/core/theme/app_theme.dart';
import 'package:weather_app/src/feature/theme/provider/theme_provider.dart';

/// Theme settings widget for controlling app themes
class ThemeSettingsWidget extends ConsumerWidget {
  const ThemeSettingsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeNotifierProvider);
    final themeNotifier = ref.read(themeNotifierProvider.notifier);

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.palette,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Theme Settings',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => themeNotifier.toggleThemeMode(),
                  icon: Icon(_getThemeIcon(themeState.themeMode)),
                  tooltip: 'Toggle Theme Mode',
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Theme Mode Selection
            Text(
              'Theme Mode',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: AppThemeMode.values.map((mode) {
                final isSelected = themeState.themeMode == mode;
                return FilterChip(
                  selected: isSelected,
                  label: Text(_getThemeModeName(mode)),
                  onSelected: (selected) {
                    if (selected) {
                      themeNotifier.changeThemeMode(mode);
                    }
                  },
                );
              }).toList(),
            ),
            
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            
            // Weather Theme Variant Selection
            Text(
              'Weather Theme',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Column(
              children: WeatherThemeVariant.values.map((variant) {
                final isSelected = themeState.themeVariant == variant;
                return RadioListTile<WeatherThemeVariant>(
                  title: Text(_getVariantName(variant)),
                  subtitle: Text(_getVariantDescription(variant)),
                  value: variant,
                  groupValue: themeState.themeVariant,
                  onChanged: (value) {
                    if (value != null) {
                      themeNotifier.changeThemeVariant(value);
                    }
                  },
                  secondary: Icon(_getVariantIcon(variant)),
                );
              }).toList(),
            ),
            
            const SizedBox(height: 16),
            
            // Info text
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 16,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Weather themes automatically switch based on current weather conditions',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getThemeIcon(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return Icons.light_mode;
      case AppThemeMode.dark:
        return Icons.dark_mode;
      case AppThemeMode.system:
        return Icons.auto_mode;
    }
  }

  String _getThemeModeName(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return 'Light';
      case AppThemeMode.dark:
        return 'Dark';
      case AppThemeMode.system:
        return 'System';
    }
  }

  String _getVariantName(WeatherThemeVariant variant) {
    switch (variant) {
      case WeatherThemeVariant.default_:
        return 'Default';
      case WeatherThemeVariant.stormy:
        return 'Stormy';
      case WeatherThemeVariant.sunny:
        return 'Sunny';
    }
  }

  String _getVariantDescription(WeatherThemeVariant variant) {
    switch (variant) {
      case WeatherThemeVariant.default_:
        return 'Cool blue theme for general weather';
      case WeatherThemeVariant.stormy:
        return 'Deep purple theme for storms and rain';
      case WeatherThemeVariant.sunny:
        return 'Warm amber theme for sunny weather';
    }
  }

  IconData _getVariantIcon(WeatherThemeVariant variant) {
    switch (variant) {
      case WeatherThemeVariant.default_:
        return Icons.wb_cloudy;
      case WeatherThemeVariant.stormy:
        return Icons.thunderstorm;
      case WeatherThemeVariant.sunny:
        return Icons.wb_sunny;
    }
  }
}