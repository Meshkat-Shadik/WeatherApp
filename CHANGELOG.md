# Changelog

## Widgetbook ↔ design_system sync check (2026-11-20)

`origin/main` has no new commits (still `7e3f10a`), so there was nothing to pull. `lib/design_system/` hasn't changed since the responsiveness removal. A full coverage check against it found:

| Gap | Fix |
|---|---|
| `AppDurations` (fast/normal/slow/toast) shown nowhere | new `design_system/tokens/motion.dart` → `MotionTokens`: one dot per duration moving the same distance, with a "Play" knob |
| `AppRadii.pill` missing from `LayoutTokens` | added |
| `medium` weight missing from `TypeScale` | added |
| raw `AppColors.amberRamp` missing from `ColorTokens` | added as `amberRamp[0..5]` |
| `HeroPanelPage` "Without hero" had no backdrop, so it couldn't show that loading/error states now sit on the photo | `Backdrop` knob, on by default |

Every design-system widget file has a use-case file, and every constructor argument is set by one. Widgetbook analyzes clean; I checked the motion page and the template in the browser.

The check is now a script in the `mesh-flutter-widgetbook` skill. Run it after any design-system change:

```bash
python3 ~/.claude/skills/mesh-flutter-widgetbook/scripts/check_coverage.py
```

## Widgetbook: fixed two-root tree + `mesh-flutter-widgetbook` skill (2026-11-18)

The widgetbook sidebar now uses its own fixed convention instead of mirroring `lib/` paths. The same tree appears in every Mesh project, whatever the codebase's folder names are:

| Before | After |
|---|---|
| `app/weather_app.dart` | `app/full_app.dart` |
| `app/features/location/presentation/screens/initial_location_screen.dart` | `app/screens/location/initial_location_screen.dart` |
| `app/features/weather/presentation/screens/weather_information_screen.dart` | `app/screens/weather/weather_information_screen.dart` |
| `app/features/location/presentation/widgets/current_location_result.dart` | `app/widgets/location/current_location_result.dart` |
| `app/features/weather/presentation/widgets/{weather_hero,weather_details_panel}.dart` | `app/widgets/weather/…` |

`design_system/` is unchanged (tokens, theme, primitives, components, templates, feedback). The shallower `app/` tree (3 levels at most) also removes the sidebar's "RenderFlex overflowed" stripes.

The whole setup now lives in a new skill, `~/.claude/skills/mesh-flutter-widgetbook/`:

- **SKILL.md** covers:
  - the tree convention
  - setup steps
  - the four material_ui interop fixes
  - use-case rules
  - screen and full-app fakes
  - how to run it
- **`references/troubleshooting.md`**: every widgetbook failure hit in this project, with its fix.
- **`templates/`**: this catalog with package names generalized (pubspec, build.yaml, main.dart, support/, and every use-case file).

`mesh-flutter` now points to it instead of carrying its own widgetbook section and templates.

## Responsiveness removed for now; Inspector addon fixed (2026-11-18)

| Area | Before | After |
|---|---|---|
| `design_system/responsive/` (DeviceType, DeviceTypeLayout, context.device, …) | present | deleted |
| `HeroPanelPage` | stacked on mobile, side-by-side on tablet/desktop | always stacked (collapsing photo header + rounded panel). The photo still shows in loading and error states |
| `BackdropPage` | content capped at 560px on wide windows | full width with `AppSpacing.screen` padding |
| `StatGrid` | columns from its own width (`LayoutBuilder`) | `columns` parameter, default 2 |
| Tokens | `AppSize.readableWidth`, `AppSize.tileMinWidth` | removed |
| Tests | `design_system_responsive_test.dart` | removed |
| Widgetbook | responsive "Bands" use case, MacBook Pro viewport | removed |

The phone-panel fix from the responsive work stays: the body sits in a box sliver and the leftover space is a sibling filler.

**Widgetbook Inspector crash** ("No MaterialLocalizations found" from an `ExpansionTile`). The Inspector addon is built on the SDK `flutter/material`, and its panel renders inside our `material_ui` `MaterialApp`, which only provided `material_ui`'s localizations. `widgetbook/lib/main.dart` now also registers `sdk.DefaultMaterialLocalizations.delegate`. I checked in a browser: switching Inspector on and selecting a widget opens its panel, with no errors.

Known cosmetic issue: on narrow windows, widgetbook's own navigation sidebar overflows by a few pixels at the deepest `app/features/<f>/presentation/...` folders. It disappears in a wider window.

## Backgrounds, two-root Widgetbook, responsive layer (2026-11-18)

### Background image

I checked on the iOS Simulator (iPhone 17), the Android emulator (Pixel 9 Pro), and in the widgetbook as both a debug and a release web build. The location photo and the weather photo both render in every one of them. What was genuinely missing:

| Case | Before | After |
|---|---|---|
| Weather screen while loading, or on an error (no network, unknown city, API problem) | plain dark colour, no photo | `HeroPanelPage` paints the backdrop for every state; the photo belongs to the page, not the hero |
| Error action on a photo ("Retry", "Open settings") | low-contrast text button | `StatusMessage` uses an outlined button in the message colour |

### iOS: location permission and CocoaPods

| Before | After |
|---|---|
| `Info.plist` had no `NSLocationWhenInUseUsageDescription`. Under SwiftPM, permission_handler enables permissions from those keys, so iOS reported location as permanently denied without ever prompting | key added. The project's DerivedData had to be cleared once, because the package manifest caches what it found |
| `PermissionManager` opened iOS Settings by itself on a permanent denial, dropping the user into Settings on launch | returns `granted / denied / blocked`; a blocked permission shows "Location is off for this app. Turn it on in Settings." with an **Open settings** button |
| CocoaPods still integrated (Podfile, Pods, xcconfig includes, workspace entry) | removed (`pod deintegrate`). Every iOS plugin now resolves through Swift Package Manager |

### Widgetbook: two roots that mirror the code

Before, the widgetbook had five top-level folders: `design_system`, `composites`, `screens`, `app` and `support`. Now there are two, plus `support/` for helpers (no use cases in it):

```
design_system/   tokens/ theme/ primitives/ components/ templates/ feedback/ responsive/
app/             weather_app.dart  (whole app, mirrors lib/main.dart)
                 features/<f>/presentation/{widgets,screens}/  (mirrors lib exactly)
```

`app/common/` is reserved for shared non-design-system widgets. The app has none today, so the folder doesn't exist yet. The Viewport addon gained a MacBook Pro (desktop) entry.

### Responsiveness — the decision

The responsive kernel (`DeviceType`, `DeviceTypeLayout`, `context.device`, `OrientationLayout`, `AppContentWidth`) moved into `design_system/responsive/`. It's pure Flutter, so the design system stays portable. The bands are mobile < 600, tablet 600–1199, desktop ≥ 1200. Phones and tablets are measured by their shortest side, desktop and web by window width.

| Layer | Owns | In this app |
|---|---|---|
| Templates | arrangement per band | `HeroPanelPage`: stacked collapsing header + rounded panel on mobile; photo + hero left, panel right on tablet/desktop. `BackdropPage`: content column capped at `AppSize.readableWidth` (560) on any wide window, including a rotated phone |
| Components | density by their own width | `StatGrid` fits as many 160px tiles as its box allows (2–3 columns) |
| Screens | nothing | one file each; `screens/mobile/` became `screens/` |
| Router | different content per band | not needed yet; `DeviceTypeLayout` variants only when a band shows different content |

`test/design_system_responsive_test.dart` pumps both templates at phone, rotated phone, tablet and desktop sizes.

- **It caught a real crash before shipping.** The adaptive `StatGrid` (`LayoutBuilder`) inside `SliverFillRemaining(hasScrollBody: false)` throws, because that sliver measures intrinsic size and `LayoutBuilder` can't report it. The phone panel is now a box sliver, plus a sibling filler that paints the rest of the panel.

### Verification

- `flutter analyze` reports no issues and `flutter test` passes 13/13.
- **iOS Simulator:** location screen (photo, blocked-permission state), and London weather (photo, icon, panel).
- **Android emulator:** location screen with the photo.
- **Debug widgetbook (web):** the weather error state on the photo, and the side-by-side layout in a wide viewport.

## Portable design_system + layered Widgetbook (2026-11-18)

### `lib/design_system/` — a drop-in UI kit

The design system is now one self-contained folder. No file in it imports anything from the app; it imports only its own files (by relative path), plus flutter, material_ui, google_fonts and flutter_hooks. You can copy the folder into another project's `lib/` without changing any code. To verify that, I copied it into a blank package with a different name, and it analyzes clean. `test/design_system_independence_test.dart` fails if an app import ever creeps in.

| Layer | Before | After |
|---|---|---|
| Tokens | `core/theme/app_colors.dart`, `app_tokens.dart`, `app_typography.dart` | `design_system/tokens/` (`AppSize.weatherIcon` renamed to `AppSize.iconXl`) |
| Theme | `core/theme/app_colors.dart` (palette), `app_theme.dart` | `design_system/theme/app_palette.dart`, `app_theme.dart` |
| Primitives | `core/common/widgets/image_backdrop.dart`; stat tile, search field and section header were feature widgets | `design_system/primitives/`: `ImageBackdrop`, `PlaceholderImage` (new, wraps `DecorationImage.placeholder`), `SearchField` (was `CitySearchField`), `SectionHeader` (extracted from the details panel), `StatTile` (was `WeatherStatTile`) |
| Components | `core/common/widgets/status_message.dart`; grid inlined in the details panel | `design_system/components/`: `StatusMessage`, `StatGrid` + `StatItem` |
| Templates | layout `Stack`/`CustomScrollView` code inside each screen | `design_system/templates/`: `BackdropPage(children:)` (location), `HeroPanelPage(hero:, body:)` (weather) |
| Feedback | `core/feedback/app_feedback.dart`, which took an `AppFailure` | `design_system/feedback/app_feedback.dart`, string-based: `retry(context, title:, message:)` |
| Extensions | `core/extensions/context_x.dart` | `design_system/extensions/context_x.dart` |
| Imports | `core/theme/theme.dart` barrel | `design_system/design_system.dart` barrel, the only design import in the app |

Above the design system:

- **Composites** stay in their features and are now built from design-system pieces: `WeatherHero` (uses `PlaceholderImage`), `WeatherDetailsPanel` (`SectionHeader` + `StatGrid`) and `CurrentLocationResult`.
- **Screens** only branch on state and fill a template's slots. For example, the weather screen is `final (hero, body) = switch (state) {…}; return HeroPanelPage(...)`.

### Widgetbook mirrors the layers

`widgetbook/build.yaml` sets `nav_path_mode: use-case`, so the navigation tree follows widgetbook's own folders. There are 23 use cases across 21 components:

```
design_system/
  tokens/      ColorTokens (every palette role + raw colour, per theme), TypeScale, LayoutTokens
  theme/       ThemePreview (themed input, buttons, snackbar, progress)
  primitives/  ImageBackdrop, PlaceholderImage, SearchField, SectionHeader, StatTile
  components/  StatGrid, StatusMessage (on background / on photo)
  templates/   BackdropPage, HeroPanelPage (with / without hero) — labelled slot boxes
  feedback/    AppFeedback (toast, retry dialog)
composites/    weather/WeatherHero, weather/WeatherDetailsPanel, location/CurrentLocationResult
screens/       weather + location, each with a data/loading/error knob
app/           WeatherApp "Full flow" — real router, screens and notifiers; only GPS and the weather API are faked
```

The single `use_cases/*.dart` files were replaced by one use-case file per design-system file. The shared frames (`onPhoto`/`onPanel`/`onBackground`), fixtures and the `Slot` placeholder live in `widgetbook/lib/support/`.

Known limitation: on web, while "Full flow" is open the app's go_router writes its own route into the address bar. Reloading then lands on the widgetbook home page.

### Verification

- App: `flutter analyze lib test` reports no issues, 5/5 tests pass (including the new independence test), and `flutter build apk --debug` succeeds.
- Widgetbook: analyzes clean and builds for web. I checked these in a browser: full flow (location → "Tap to see more!" → weather), the palette page and the hero-panel template.

## Mesh-style modernization: no freezed, go_router, design system, Widgetbook (2026-11-18)

This follows the 3.50 bump below. It removes all codegen for value types and replaces auto_route. It also builds the mesh-flutter design system, makes every widget a plain-input component, and catalogs them in Widgetbook. Where the 3.50 features fit, the app now uses them.

### Dependencies

| Before | After | Why |
|---|---|---|
| `freezed`, `freezed_annotation`, `json_serializable`, `build.yaml` | `equatable` | Value types are Equatable with a hand-written `copyWith`; JSON is a hand-written `fromJson` |
| `auto_route`, `auto_route_generator` | `go_router` ^18.1.4 | Navigation facade with path params |
| `fluttertoast` | removed | It was the only plugin applying KGP, the source of the "future versions will fail to build" warning. Toasts now go through `AppFeedback.toast` (SnackBar) |
| `device_info_plus` | removed | Only used for a storage-permission branch the app never takes |
| `flutter_riverpod` (`any`), `dio` (`any`) | removed / `dio: ^5.11.1` | `hooks_riverpod` already exports it; the `any` constraint is pinned |

### Value types and state

| Area | Before | After |
|---|---|---|
| Async state | `@freezed ApiRequestState` with `IDLE`/`LOADING`/`DATA`/`FAILED` | `sealed class ApiResult<T> extends Equatable` with public `ApiInitial`/`ApiLoading`/`ApiSuccess(data)`/`ApiError(failure)` |
| Failures | freezed `AppFailure`/`LocalFailure`/`NetworkFailure` (copyWith via an extension) | Equatable classes with primary constructors; each subclass overrides `copyWith` with its own return type |
| `FailureMapper.getFailures` | `Exception` only (`on Exception catch`) | `Object?`, so a `TypeError` from bad JSON becomes a failure instead of crashing |
| Entities | `WeatherFullEntity` with 4 nested freezed entities, plus `WeatherBasicEntity` and `WeatherDetailEntity` (pre-formatted strings) | one flat `WeatherEntity` (Equatable, `copyWith`, `DateTime`s); formatting moved to presentation |
| DTO | freezed + json_serializable + `StringConverter` | hand-written `WeatherDto.fromJson` (snake_case keys and int/double tolerance pinned by a test) |
| Repositories | weather returned the DTO; location threw raw exceptions | both return `Either<AppFailure, …>`; DTO→entity mapping is in the data layer |

### Navigation

| Before | After |
|---|---|
| `@RoutePage()` + `AppRouter extends RootStackRouter` + `appRouterProvider` | `AppRouter.router` (`GoRouter`) facade; `MaterialApp.router(routerConfig:)` |
| `getCityNameProvider.setCityName(x)` then `context.router.push(WeatherInformationRoute())` | `AppRouter.pushWeather(city)` → `/weather/:city` |
| Screen kicked off the fetch in `useEffect` + `addPostFrameCallback` | `weatherProvider(city)` is a family notifier that fetches in `build`; pull-to-refresh and retry call `fetch()` |
| Location refresh called `ref.invalidate` but never re-located, leaving the spinner up forever | the notifier locates in `build`, so `invalidate` re-runs it |
| Denying location permission left the spinner up forever (and re-prompted in a loop) | `ApiError(PermissionDenied)` with a "Try again" action |

### Design system (mesh-flutter `core/theme`)

| Before | After |
|---|---|
| `app_styles.dart`: loose top-level `BoxDecoration`s, hex colours, `GoogleFonts.raleway(fontSize: 48)` | `app_colors.dart` holds the raw hex values plus an `AppPalette` `ThemeExtension` with `light`/`dark` instances |
| — | `app_tokens.dart` (`AppSpacing`, `AppRadii`, `AppSize`, `AppDurations`), `app_typography.dart` (`context.typography.hero.numerals`) |
| `ThemeData(primarySwatch: Colors.blue)` | `AppTheme.light()` / `AppTheme.dark()` from one `_base`, with Raleway text theme, pill inputs, button/snackbar/progress chrome |
| `MediaQuery.of(this).size.height` | `MediaQuery.sizeOf(this).height` (`context_x.dart`), so it only rebuilds on size changes |
| `FailureHandler.listenForErrors` (inline `showDialog`) | `ref.listen` → `AppFeedback.retry(context, failure)` |
| `ColoredLogger` + 379-line ANSI `PrettyDioLogger` + unused cancel/refresh-token interceptors | `log.d/i/w/e` (`app_logger.dart`) + Dio `LogInterceptor` in debug only |

### Components (plain inputs, catalogable)

| Before | After |
|---|---|
| `BuildSucessLocation` (`ConsumerWidget`; wrote a provider, pushed a route) | `CurrentLocationResult(city:, onOpen:)` |
| Inline `TextField` + `inputDecoration.copyWith` in the screen | `CitySearchField(onSearch:)` (submits on keyboard too) |
| `BasicWeatherInformation(data: WeatherBasicEntity)` | `WeatherHero(cityName:, temperature:, icon: ImageProvider, …)` |
| `DetailBlock` + `DetailsWeatherInformation(data: entity)` | `WeatherStatTile(…)` + `WeatherDetailsPanel(wind:, humidity:, …)` |
| `Stack`s of `Positioned` containers sized by `context.height / 2` | `ImageBackdrop` + `CustomScrollView`/`SliverAppBar`; `StatusMessage` for error states |

### Flutter 3.50 / Dart 3.14 features now used

| Feature | Where |
|---|---|
| `DecorationImage(placeholder:)` (3.50) | `WeatherHero` icon: the bundled `ClearDay.png` paints until the OpenWeather icon loads, replacing `NetworkImage(… ?? 'http://via.placeholder.com/…')` |
| `SliverClipRRect` (3.50) | the rounded "Weather Details" panel, clipped as a sliver |
| Primary constructors (Dart 3.14) | every widget, failure, entity and `ApiResult` variant: `class const X({super.key, required final T a}) extends …` |
| Dot shorthands, null-aware elements, wildcard `_`, `if case`, map patterns | `.center`/`.min` throughout; `[condition, ?observedAt]`; `builder: (_, _) =>`; `ApiInterceptor` uses `{'success': false}` / `{'message': final msg}` |
| SwiftPM per project | `flutter: config: enable-swift-package-manager: true` in pubspec (CocoaPods trunk goes read-only Dec 2026). Four plugins resolve via SwiftPM; `path_provider_foundation` (from google_fonts) still uses pods |
| `dart migrate` | `--dry-run` reports the package is already at 3.14; it's recorded in the skill for the next bump |

Not applicable here: native interop/JNI, desktop multi-window, hybrid composition (no platform views), and `ListView.separated(itemExtentBuilder:)` (no lists).

### Fixes found along the way

- **Weather icons were never loading on Android.** `imgBaseUrl` used `http://`, which Android blocks as cleartext. It now uses `https://`.
- **Error toasts showed "null".** The interceptor read OpenWeather's error body via `['detail']`; it now reads `message` first (e.g. "city not found").
- **iOS build.** The Podfile declared a `RunnerTests` target that this project never had, so `pod install` failed. The block is removed and the platform pinned to `ios 15.0`. Flutter's iOS migration also updated `AppDelegate.swift` (`@main`, implicit-engine plugin registration) and `Info.plist`.

### Widgetbook (`widgetbook/`)

A sibling app (web/macOS) that catalogs 9 components across 10 use cases, with knobs on every constructor argument:

- **Components:** `WeatherHero`, `WeatherStatTile`, `WeatherDetailsPanel` (all values, and with optional values missing), `CitySearchField`, `CurrentLocationResult`, `ImageBackdrop`, `StatusMessage`.
- **Screens:** `WeatherInformationScreen` and `InitialLocationScreen` with a data/loading/error knob.
  - The weather screen runs its real notifier against a fake repository.
  - The location screen pins the notifier, because it needs GPS.
- **Addons:** Theme (dark/light `AppTheme`), Viewport (none, iPhone 13, Galaxy S20, iPad), Text scale 1–2, Inspector.
- **material_ui interop:** widgetbook 3.25 is built on the SDK `flutter/material`, whose types differ from `material_ui`'s.
  - Each use case gets its own `material_ui` `MaterialApp`, and the theme comes in through `ThemeAddon<ThemeData>`.
  - An asset bundle redirects `assets/…` to `packages/weather_app/assets/…`.
  - `AppFeedback` dialogs use `useRootNavigator: false`. Before that change the retry dialog crashed with a null check.

```bash
cd widgetbook && fvm dart run build_runner build && fvm flutter run -d chrome
```

### Verification (this round)

- App: `flutter analyze` reports no issues, and `flutter test` passes 4/4 (`ApiResult` switch, Equatable/`copyWith`, failure mapping, DTO→entity parse).
- `flutter build apk --debug` builds with no KGP warning, now with `android.builtInKotlin=true`. Removing fluttertoast was the last thing blocking AGP 9 built-in Kotlin; `android.newDsl` stays `false`.
- `flutter build ios --debug --no-codesign` builds `Runner.app` with SwiftPM on. `pod install` needs `LANG=en_US.UTF-8` in the shell.
- Widgetbook analyzes clean and builds for web. I checked these in a browser: weather data and error (retry dialog) states, location data state, with assets and the Raleway font loading.

## Flutter 3.24.3 → 3.50.0 migration (2026-11-17)

The Flutter 3.50 Gradle plugin refuses to build with Gradle < 9.3.1, AGP < 9.1.1
or Kotlin < 2.4.10, and the old code generators can't read Dart 3.14 code. That
made this a forced migration rather than an optional upgrade. The reference for
"after" is a fresh `flutter create` on 3.50.0.

### Toolchain

| Item | Before | After |
|---|---|---|
| Flutter (`.fvmrc`) | 3.24.3 | **3.50.0** |
| Dart SDK constraint | `>=3.5.0-259.0.dev <4.0.0` | `^3.14.0` |
| Gradle wrapper | 7.5 | **9.5.0** |
| Android Gradle Plugin | 7.3.0 | **9.3.1** |
| Kotlin Gradle Plugin | 1.9.0 | **2.4.20** |
| compileSdk / targetSdk | 34 / 33 (hard-coded) | `flutter.compileSdkVersion` / `flutter.targetSdkVersion` (36 / 36) |
| minSdk | 24 (hard-coded) | `flutter.minSdkVersion` (24) |
| NDK | default | `flutter.ndkVersion` |

### Android: `android/`

**Build scripts moved from Groovy to Kotlin DSL.** `settings.gradle`, `build.gradle` and
`app/build.gradle` were deleted and replaced by `*.gradle.kts`.

Before (`app/build.gradle`):
```groovy
plugins {
    id "com.android.application"
    id "kotlin-android"
    id "dev.flutter.flutter-gradle-plugin"
}
def localProperties = new Properties()   // manual versionCode/versionName parsing
...
android {
    compileSdkVersion 34
    kotlinOptions { jvmTarget = '17' }
    sourceSets { main.java.srcDirs += 'src/main/kotlin' }
    defaultConfig {
        minSdkVersion 24
        targetSdkVersion 33
        versionCode flutterVersionCode.toInteger()
        multiDexEnabled true
    }
}
```

After (`app/build.gradle.kts`):
```kotlin
plugins {
    id("com.android.application")
    id("dev.flutter.flutter-gradle-plugin")
}
android {
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion
    defaultConfig {
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }
}
kotlin { compilerOptions { jvmTarget = JvmTarget.JVM_17 } }
```

The other build changes:

- **`kotlin-android` is no longer applied in the app module.** AGP 9 has built-in Kotlin support. The `kotlinOptions` block became `kotlin { compilerOptions }`.
- **`local.properties` version parsing is gone.** `flutter.versionCode` and `flutter.versionName` come from `pubspec.yaml`.
- **`multiDexEnabled` and the `src/main/kotlin` sourceSet line are gone.** Both are defaults at minSdk 24 and AGP 9.
- **Root `build.gradle.kts`** uses `layout.buildDirectory` instead of the removed `buildDir` API.

**`gradle.properties`**

| Before | After |
|---|---|
| `org.gradle.jvmargs=-Xmx1536M` | `-Xmx8G -XX:MaxMetaspaceSize=4G -XX:ReservedCodeCacheSize=512m -XX:+HeapDumpOnOutOfMemoryError` |
| `android.enableJetifier=true` | removed (every dependency is AndroidX) |
| — | `android.newDsl=false` (AGP 9 new-DSL opt-out, from the template) |
| — | `android.builtInKotlin=false` (opt-out until every plugin supports built-in Kotlin) |

**`AndroidManifest.xml`**

| Before | After |
|---|---|
| `SplashScreenDrawable` meta-data | removed. It was a v1-embedding leftover that the engine ignores. |
| — | `android:taskAffinity=""` on `MainActivity` (template default; stops task hijacking) |
| — | `<queries>` `PROCESS_TEXT` block (used by the engine's text-processing plugin) |

The location and internet permissions are unchanged.

**`MainActivity.kt`**: `class MainActivity: FlutterActivity() {}` became `class MainActivity : FlutterActivity()`. No behaviour changed.

The comment-only template updates are in `styles.xml` (both), the debug and profile manifests, and `.gitignore` (which now also ignores `.cxx/`, `*.jks` and `*.keystore`).

### Dependencies

| Package | Before | After | Breaking change handled |
|---|---|---|---|
| `material_ui` | — | ^1.11.1 | **new**: the SDK's `package:flutter/material.dart` is deprecated since 3.47 |
| hooks_riverpod | ^2.6.1 | ^3.5.0 | `FooRef` → `Ref`, `ProviderBase` → `ProviderListenable` |
| riverpod_annotation / generator | ^2.6 | ^4.0 | `LocationNotifier` now generates `locationProvider` |
| riverpod_lint | ^2.6.3 | ^3.2.0 | no longer runs on custom_lint |
| freezed / freezed_annotation | ^2.5 / ^2.4 | ^4.0 / ^3.1 | `abstract`/`sealed` + `with _$X` are required |
| auto_route / generator | ^9.2 / ^9.0 | ^11.2 / ^10.6 | none needed |
| retrofit_generator | ^9.1.5 | ^10.3.3 | none needed |
| geolocator | ^13.0.2 | ^14.1.2 | none needed |
| geocoding | ^3.0.0 | ^5.0.1 | top-level functions → `Geocoding()` instance |
| permission_handler | ^11.3.1 | ^13.0.2 | none needed |
| device_info_plus | ^11.1.1 | ^13.3.0 | none needed |
| fluttertoast | ^8.2.8 | ^10.0.2 | none needed |
| google_fonts | ^6.2.1 | ^9.0.0 | none needed |
| flutter_hooks | ^0.20.5 | ^0.21.4 | none needed |
| cupertino_icons | ^1.0.8 | ^2.0.0 | none needed |

### Dart code

| Area | Before | After |
|---|---|---|
| Material import (every UI file and the test) | `import 'package:flutter/material.dart';` | `import 'package:material_ui/material_ui.dart';` (via `dart fix --code=migrate_design_widgets`) |
| Freezed classes | `sealed class X implements _$X` | `sealed class X with _$X` |
| Freezed failures | `class LocalFailure with _$LocalFailure implements AppFailure` | `abstract class LocalFailure …` (same for `NetworkFailure`) |
| `AppFailure` | `abstract class AppFailure implements _$AppFailure, Exception` | `abstract class AppFailure with _$AppFailure implements Exception` |
| Provider functions | `Dio dio(DioRef ref)` and the other `*Ref` types | `Dio dio(Ref ref)` |
| Generated notifier names | `locationNotifierProvider`, `weatherNotifierProvider` | `locationProvider`, `weatherProvider` |
| `FailureHandler.listenForErrors` | `ProviderBase<ApiRequestState<T>>` + `maybeWhen(failed: …)` | `ProviderListenable<…>` + `if (current case FAILED(reason: final failure))` |
| State rendering in screens | `state.maybeWhen(loading:…, data:…, failed:…, orElse:…)` | exhaustive `switch (state) { LOADING() => …, DATA(:final data) => …, FAILED(:final reason) => …, IDLE() => … }` |
| Reverse geocoding | `placemarkFromCoordinates(lat, lng)` | `Geocoding().placemarkFromCoordinates(lat, lng)` |
| Entity and DTO fields | `@required List<…>? weather` | `List<…>? weather` (`@required` is deprecated) |
| Colours | `.withOpacity(0.4)` | `.withValues(alpha: 0.4)` (wide-gamut `Color`, 3.27) |
| Codegen command | `build_runner build --delete-conflicting-outputs` | `build_runner build` (the flag was removed) |

### Flutter 3.27–3.50 changes that don't affect this app (yet)

- **Edge-to-edge by default (3.27).** Android 15+ enforces it at target 35+. The screens use full-bleed `Stack`s, so check status-bar overlap on a device.
- **Predictive-back page transition by default on Android (3.38).**
- **Engine flags passed as Intent extras are ignored in release builds (3.50).** Declare them in the manifest instead. This app sets none.
- **Stricter Intent verification for entrypoints (3.50).** It only affects deep links, and this app has none.
- **Dart features now available:**
  - 3.7: wildcard `_` and the tall formatter
  - 3.8: null-aware elements `[?x]`
  - 3.10: dot shorthands `.center`
  - 3.12: private named parameters
  - 3.13: primary constructors
- **Flipping `android.builtInKotlin` and `android.newDsl` to `true`** waits until every plugin supports them. `fluttertoast` still applies KGP, and plugins that do will break under AGP 10.

### Android `compileSdk`

| Before | After |
|---|---|
| `compileSdkVersion 34` | `compileSdk = 37` |

`permission_handler_android` 14 fails `checkDebugAarMetadata` below API 37, and Flutter 3.50 defaults to 36. `targetSdk` stays on `flutter.targetSdkVersion` (36).

### Project structure (mesh-flutter feature layout)

The app moved from `lib/src/{core,feature,routes}` with `domain/` and `infrastructure/` layers to `lib/{core,features}`. Each feature now has `application/`, `data/` and `presentation/`. Imports point inward only: presentation → application → data.

| Before | After |
|---|---|
| `lib/src/core/failure/`, `lib/src/core/networking/` | `lib/core/failure/`, `lib/core/networking/` |
| `lib/src/core/helper/colored_logger.dart` | `lib/core/utils/colored_logger.dart` |
| `lib/src/core/helper/extensions.dart` | `lib/core/extensions/extensions.dart` |
| `lib/src/core/utils/permission_manager.dart` | `lib/core/services/permission_manager.dart` |
| `lib/src/feature/common/providers.dart` | `lib/core/common/providers/providers.dart` |
| `lib/src/feature/common/states/api_state.dart` | `lib/core/common/state/api_state.dart` |
| `lib/src/routes/router.dart` | `lib/core/router/app_router.dart` |
| `lib/src/feature/weather/presentation/styles.dart` | `lib/core/theme/app_styles.dart` |
| `lib/src/feature/weather/presentation/constants.dart` (empty) | deleted |
| `feature/<f>/application/notifiers/<f>_notifier.dart` | `features/<f>/application/<f>_provider.dart` |
| `feature/<f>/application/providers.dart` | `features/location/application/location_repository_provider.dart`, `features/weather/application/weather_misc_providers.dart` |
| `feature/<f>/domain/base_repositories/base_<f>_repository.dart` | `features/<f>/data/repositories/<f>_repository.dart` |
| `feature/<f>/infrastructure/…<f>_repository.dart` | `features/<f>/data/repositories/<f>_repository_impl.dart` |
| `feature/weather/domain/entity/*` | `features/weather/data/entities/*` |
| `feature/weather/infrastructure/dto/weather_model/weather_dto.dart` | `features/weather/data/dto/weather_dto.dart` |
| `presentation/screen/weather_infromation_screen.dart` | `presentation/screens/mobile/weather_information_screen.dart` (filename typo fixed) |
| `presentation/screen/initial_location_screen.dart` | `presentation/screens/mobile/initial_location_screen.dart` |

Class names and public APIs did not change. Generated `part` files were regenerated under their new names.

### Verification

- `flutter analyze`: no issues.
- `flutter build apk --debug`: builds `app-debug.apk` (AGP 9.3.1, Gradle 9.5.0, compileSdk 37). The only warning is that `fluttertoast` 10.0.2 still applies KGP. That plugin is what keeps `android.builtInKotlin=false`.
- `flutter test`: passes. The stale template counter test (it never matched this app) was replaced by an `ApiRequestState` pattern-matching test.
