# design_system

Portable UI kit: drop this folder into any Flutter app's `lib/` and import the
barrel. No file here imports anything from the host app.

| Layer | Folder | What lives there |
|---|---|---|
| Tokens | `tokens/` | raw colours (`AppColors`), spacing/radii/sizes/durations, type scale |
| Theme | `theme/` | `AppPalette` (light/dark `ThemeExtension`), `AppTheme.light()/dark()`, `context.colors` |
| Primitives | `primitives/` | single-purpose widgets: `ImageBackdrop`, `PlaceholderImage`, `SearchField`, `SectionHeader`, `StatTile` |
| Components | `components/` | primitives composed: `StatGrid` (+ `StatItem`), `StatusMessage` |
| Templates | `templates/` | page layouts with slots, no data: `BackdropPage`, `HeroPanelPage` |
| Feedback | `feedback/` | `AppFeedback.toast/retry` (string-based) |
| Extensions | `extensions/` | `context.width/height` via `MediaQuery.sizeOf` |

Rules:
- Imports: relative within the folder, plus `dart:`, `package:flutter/`,
  `package:material_ui/`, `package:google_fonts/`, `package:flutter_hooks/`.
  Nothing else — `test/design_system_independence_test.dart` fails otherwise.
- Widgets take plain values, `ImageProvider`s and callbacks. Never an app
  entity, provider, router or asset path.
- A new project changes token *values* (`app_colors.dart`, `app_palette.dart`,
  `app_typography.dart`), not code.

Host pubspec needs: `material_ui`, `google_fonts`, `flutter_hooks`.
