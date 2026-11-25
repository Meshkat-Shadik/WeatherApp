/// The app's design system — the only import UI code needs:
/// `import 'package:<app>/design_system/design_system.dart';`
///
/// Self-contained by contract: files in this folder import only each other
/// (relative paths), `dart:`, flutter, material_ui, google_fonts and
/// flutter_hooks. `test/design_system_independence_test.dart` enforces it, so
/// the folder can be copied into another app unchanged.
library;

export 'components/stat_grid.dart';
export 'components/stat_item.dart';
export 'components/status_message.dart';
export 'extensions/context_x.dart';
export 'feedback/app_feedback.dart';
export 'primitives/image_backdrop.dart';
export 'primitives/placeholder_image.dart';
export 'primitives/search_field.dart';
export 'primitives/section_header.dart';
export 'primitives/stat_tile.dart';
export 'templates/backdrop_page.dart';
export 'templates/hero_panel_page.dart';
export 'theme/app_palette.dart';
export 'theme/app_theme.dart';
export 'tokens/app_colors.dart';
export 'tokens/app_tokens.dart';
export 'tokens/app_typography.dart';
