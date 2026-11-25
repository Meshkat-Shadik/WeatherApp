// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:weather_widgetbook/app/full_app.dart'
    as _weather_widgetbook_app_full_app;
import 'package:weather_widgetbook/app/screens/location/initial_location_screen.dart'
    as _weather_widgetbook_app_screens_location_initial_location_screen;
import 'package:weather_widgetbook/app/screens/weather/weather_information_screen.dart'
    as _weather_widgetbook_app_screens_weather_weather_information_screen;
import 'package:weather_widgetbook/app/widgets/location/current_location_result.dart'
    as _weather_widgetbook_app_widgets_location_current_location_result;
import 'package:weather_widgetbook/app/widgets/weather/weather_details_panel.dart'
    as _weather_widgetbook_app_widgets_weather_weather_details_panel;
import 'package:weather_widgetbook/app/widgets/weather/weather_hero.dart'
    as _weather_widgetbook_app_widgets_weather_weather_hero;
import 'package:weather_widgetbook/design_system/components/stat_grid.dart'
    as _weather_widgetbook_design_system_components_stat_grid;
import 'package:weather_widgetbook/design_system/components/status_message.dart'
    as _weather_widgetbook_design_system_components_status_message;
import 'package:weather_widgetbook/design_system/feedback/app_feedback.dart'
    as _weather_widgetbook_design_system_feedback_app_feedback;
import 'package:weather_widgetbook/design_system/primitives/image_backdrop.dart'
    as _weather_widgetbook_design_system_primitives_image_backdrop;
import 'package:weather_widgetbook/design_system/primitives/placeholder_image.dart'
    as _weather_widgetbook_design_system_primitives_placeholder_image;
import 'package:weather_widgetbook/design_system/primitives/search_field.dart'
    as _weather_widgetbook_design_system_primitives_search_field;
import 'package:weather_widgetbook/design_system/primitives/section_header.dart'
    as _weather_widgetbook_design_system_primitives_section_header;
import 'package:weather_widgetbook/design_system/primitives/stat_tile.dart'
    as _weather_widgetbook_design_system_primitives_stat_tile;
import 'package:weather_widgetbook/design_system/templates/backdrop_page.dart'
    as _weather_widgetbook_design_system_templates_backdrop_page;
import 'package:weather_widgetbook/design_system/templates/hero_panel_page.dart'
    as _weather_widgetbook_design_system_templates_hero_panel_page;
import 'package:weather_widgetbook/design_system/theme/app_theme.dart'
    as _weather_widgetbook_design_system_theme_app_theme;
import 'package:weather_widgetbook/design_system/tokens/colors.dart'
    as _weather_widgetbook_design_system_tokens_colors;
import 'package:weather_widgetbook/design_system/tokens/motion.dart'
    as _weather_widgetbook_design_system_tokens_motion;
import 'package:weather_widgetbook/design_system/tokens/spacing.dart'
    as _weather_widgetbook_design_system_tokens_spacing;
import 'package:weather_widgetbook/design_system/tokens/typography.dart'
    as _weather_widgetbook_design_system_tokens_typography;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'app',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'WeatherApp',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Full flow',
            builder: _weather_widgetbook_app_full_app.weatherApp,
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'screens',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'location',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'InitialLocationScreen',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'States',
                    builder:
                        _weather_widgetbook_app_screens_location_initial_location_screen
                            .locationScreen,
                  ),
                ],
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'weather',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'WeatherInformationScreen',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'States',
                    builder:
                        _weather_widgetbook_app_screens_weather_weather_information_screen
                            .weatherScreen,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'widgets',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'location',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'CurrentLocationResult',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _weather_widgetbook_app_widgets_location_current_location_result
                            .currentLocationResult,
                  ),
                ],
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'weather',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'WeatherDetailsPanel',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'All values',
                    builder:
                        _weather_widgetbook_app_widgets_weather_weather_details_panel
                            .weatherDetailsPanel,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Optional values missing',
                    builder:
                        _weather_widgetbook_app_widgets_weather_weather_details_panel
                            .weatherDetailsPanelMissing,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'WeatherHero',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _weather_widgetbook_app_widgets_weather_weather_hero
                            .weatherHero,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'design_system',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'components',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'StatGrid',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Ramp',
                builder: _weather_widgetbook_design_system_components_stat_grid
                    .statGrid,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'StatusMessage',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'On background',
                builder:
                    _weather_widgetbook_design_system_components_status_message
                        .statusMessage,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'On photo',
                builder:
                    _weather_widgetbook_design_system_components_status_message
                        .statusMessageOnPhoto,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'feedback',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'AppFeedback',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Toast and retry dialog',
                builder: _weather_widgetbook_design_system_feedback_app_feedback
                    .appFeedback,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'primitives',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'ImageBackdrop',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder:
                    _weather_widgetbook_design_system_primitives_image_backdrop
                        .imageBackdrop,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'PlaceholderImage',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Loaded vs placeholder',
                builder:
                    _weather_widgetbook_design_system_primitives_placeholder_image
                        .placeholderImage,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'SearchField',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder:
                    _weather_widgetbook_design_system_primitives_search_field
                        .searchField,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'SectionHeader',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder:
                    _weather_widgetbook_design_system_primitives_section_header
                        .sectionHeader,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'StatTile',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder: _weather_widgetbook_design_system_primitives_stat_tile
                    .statTile,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'templates',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'BackdropPage',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Slots',
                builder:
                    _weather_widgetbook_design_system_templates_backdrop_page
                        .backdropPage,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HeroPanelPage',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'With hero',
                builder:
                    _weather_widgetbook_design_system_templates_hero_panel_page
                        .heroPanelPage,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Without hero',
                builder:
                    _weather_widgetbook_design_system_templates_hero_panel_page
                        .heroPanelPageBare,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'theme',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'ThemePreview',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Components',
                builder: _weather_widgetbook_design_system_theme_app_theme
                    .themePreview,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'tokens',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'ColorTokens',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Palette',
                builder:
                    _weather_widgetbook_design_system_tokens_colors.colorTokens,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'LayoutTokens',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Spacing, radii, sizes',
                builder: _weather_widgetbook_design_system_tokens_spacing
                    .layoutTokens,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'MotionTokens',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Durations',
                builder: _weather_widgetbook_design_system_tokens_motion
                    .motionTokens,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'TypeScale',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Scale',
                builder: _weather_widgetbook_design_system_tokens_typography
                    .typeScale,
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
