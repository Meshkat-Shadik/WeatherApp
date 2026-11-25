import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:weather_app/core/common/state/api_result.dart';
import 'package:weather_app/core/constants/app_assets.dart';
import 'package:weather_app/core/extensions/date_time_x.dart';
import 'package:weather_app/design_system/design_system.dart';
import 'package:weather_app/features/weather/application/weather_provider.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_details_panel.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_hero.dart';

class const WeatherInformationScreen({super.key, required final String city})
    extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = weatherProvider(city);
    final state = ref.watch(provider);
    Future<void> fetch() => ref.read(provider.notifier).fetch();

    ref.listen(provider, (_, next) async {
      if (next case ApiError(:final failure)) {
        final retry = await AppFeedback.retry(
          context,
          title: failure.name,
          message: failure.message,
        );
        if (retry && context.mounted) fetch();
      }
    });

    final (hero, body) = switch (state) {
      ApiSuccess(:final data) => (
        WeatherHero(
          cityName: data.cityName,
          condition: data.condition,
          description: data.description,
          observedAt: data.observedAt?.clock,
          temperature: data.temperature.toStringAsFixed(1),
          feelsLike: data.feelsLike.toStringAsFixed(1),
          icon: switch (data.iconUrl) {
            final String url => NetworkImage(url),
            null => const AssetImage(AppAssets.clearDay),
          },
          iconPlaceholder: const AssetImage(AppAssets.clearDay),
        ),
        WeatherDetailsPanel(
          wind: '${data.windSpeed}',
          humidity: '${data.humidity}',
          pressure: '${data.pressure}',
          gust: data.windGust?.toString(),
          sunrise: data.sunrise?.clock,
          sunset: data.sunset?.clock,
        ),
      ),
      ApiError(:final failure) => (
        null,
        StatusMessage(
          message: failure.message,
          color: context.colors.onImage,
          actionLabel: 'Retry',
          onAction: fetch,
        ),
      ),
      ApiInitial() || ApiLoading() => (null, const CircularProgressIndicator()),
    };

    return HeroPanelPage(
      backdrop: const AssetImage(AppAssets.night),
      hero: hero,
      body: body,
      onRefresh: fetch,
    );
  }
}
