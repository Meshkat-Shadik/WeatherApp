import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:weather_app/core/common/state/api_result.dart';
import 'package:weather_app/core/constants/app_assets.dart';
import 'package:weather_app/core/router/app_router.dart';
import 'package:weather_app/design_system/design_system.dart';
import 'package:weather_app/features/location/application/location_provider.dart';
import 'package:weather_app/features/location/presentation/widgets/current_location_result.dart';

class const InitialLocationScreen({super.key}) extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(locationProvider);
    final onImage = context.colors.onImage;
    final t = context.typography;

    return BackdropPage(
      image: const AssetImage(AppAssets.day),
      onRefresh: () async => ref.invalidate(locationProvider),
      children: [
        Text('Hello there!', style: t.titleLg.regular.copyWith(color: onImage)),
        AppSpacing.gapSm,
        Text(
          'Check the weather by the city',
          style: t.body.regular.copyWith(color: onImage),
        ),
        AppSpacing.gapXl,
        const SearchField(
          hint: 'Enter the city name',
          onSubmitted: AppRouter.pushWeather,
        ),
        SizedBox(height: context.height * .2),
        Center(
          child: switch (location) {
            ApiSuccess(:final data) => CurrentLocationResult(
              city: data,
              onOpen: () => AppRouter.pushWeather(data),
            ),
            ApiError(:final failure) => StatusMessage(
              message: failure.message,
              icon: Icons.location_off_outlined,
              color: onImage,
              actionLabel: failure == LocationNotifier.blocked
                  ? 'Open settings'
                  : 'Try again',
              onAction: failure == LocationNotifier.blocked
                  ? ref.read(locationProvider.notifier).openSettings
                  : () => ref.invalidate(locationProvider),
            ),
            ApiInitial() || ApiLoading() => const CircularProgressIndicator(),
          },
        ),
      ],
    );
  }
}
