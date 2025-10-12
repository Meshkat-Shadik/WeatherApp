import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/feature/theme/provider/theme_provider.dart';

/// Enhanced weather card that adapts to FlexColorScheme theming
class EnhancedWeatherCard extends ConsumerWidget {
  final String cityName;
  final String temperature;
  final String weatherCondition;
  final String description;
  final String iconCode;
  final double? humidity;
  final double? windSpeed;
  final double? feelsLike;
  final VoidCallback? onTap;

  const EnhancedWeatherCard({
    super.key,
    required this.cityName,
    required this.temperature,
    required this.weatherCondition,
    required this.description,
    required this.iconCode,
    this.humidity,
    this.windSpeed,
    this.feelsLike,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final themeNotifier = ref.read(themeNotifierProvider.notifier);
    
    // Auto-switch theme based on weather condition
    WidgetsBinding.instance.addPostFrameCallback((_) {
      themeNotifier.autoSwitchThemeForWeather(weatherCondition);
    });

    return Card(
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primaryContainer,
                colorScheme.primaryContainer.withOpacity(0.7),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header with city name and weather icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cityName,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onPrimaryContainer.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Weather icon placeholder (you can replace with actual icon)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      _getWeatherIcon(weatherCondition),
                      size: 48,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Temperature display
              Row(
                children: [
                  Text(
                    temperature,
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Spacer(),
                  if (feelsLike != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Feels like',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onPrimaryContainer.withOpacity(0.7),
                          ),
                        ),
                        Text(
                          '${feelsLike!.round()}°',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Additional weather info
              if (humidity != null || windSpeed != null)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colorScheme.surface.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      if (humidity != null) ..[
                        Expanded(
                          child: _InfoChip(
                            icon: Icons.water_drop,
                            label: 'Humidity',
                            value: '${humidity!.round()}%',
                            colorScheme: colorScheme,
                          ),
                        ),
                        if (windSpeed != null) const SizedBox(width: 16),
                      ],
                      if (windSpeed != null)
                        Expanded(
                          child: _InfoChip(
                            icon: Icons.air,
                            label: 'Wind',
                            value: '${windSpeed!.round()} m/s',
                            colorScheme: colorScheme,
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getWeatherIcon(String condition) {
    final lowerCondition = condition.toLowerCase();
    
    if (lowerCondition.contains('clear') || lowerCondition.contains('sunny')) {
      return Icons.wb_sunny;
    } else if (lowerCondition.contains('cloud')) {
      return Icons.wb_cloudy;
    } else if (lowerCondition.contains('rain') || lowerCondition.contains('drizzle')) {
      return Icons.grain;
    } else if (lowerCondition.contains('storm') || lowerCondition.contains('thunder')) {
      return Icons.thunderstorm;
    } else if (lowerCondition.contains('snow')) {
      return Icons.ac_unit;
    } else if (lowerCondition.contains('mist') || lowerCondition.contains('fog')) {
      return Icons.blur_on;
    }
    
    return Icons.wb_cloudy;
  }
}

/// Info chip widget for displaying weather details
class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final ColorScheme colorScheme;

  const _InfoChip({
    required this.icon,
    required this.label,
    required this.value,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 20,
          color: colorScheme.primary,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}