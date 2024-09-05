import 'package:flutter/material.dart'
    show
        AlertDialog,
        BuildContext,
        Column,
        MainAxisSize,
        Navigator,
        Text,
        TextAlign,
        TextButton,
        showDialog;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/failure/app_failure.dart';
import 'package:weather_app/failure/local_failure.dart';
import 'package:weather_app/failure/network_failure.dart';
import 'package:weather_app/feature/common/states/api_state.dart';
import 'package:weather_app/helper/colored_logger.dart';
import 'package:weather_app/helper/extensions.dart';

class FailureHandler {
  static void defaultToastShowingHandler(
      AppFailure failure, WidgetRef ref, BuildContext context) {
    ColoredLogger.Red.log(failure.toString());
    ColoredLogger.Red.log(failure.runtimeType);
    ('${failure.code}: ${failure.message}').toast(false);
  }

  static void listenForErrors<T>(
    WidgetRef ref,
    ProviderBase<ApiRequestState<T>> provider,
    BuildContext context,
    Future<void> Function() onRetry,
  ) {
    ref.listen<ApiRequestState<T>>(provider, (previous, current) {
      current.maybeWhen(
          orElse: () {},
          failed: (AppFailure failure) {
            ColoredLogger.Red.log(failure.toString());

            //? here we can check for the type of failure and show different dialogs
            final title = switch (failure) {
              NetworkFailure networkFailure =>
                '${networkFailure.code} ${networkFailure.message}',
              LocalFailure localFailure =>
                '${localFailure.name} ${localFailure.message}',
              _ => 'Unknown error'
            };

            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog.adaptive(
                  title: Text(
                    title,
                    textAlign: TextAlign.center,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //? Here we can show different graphical representation of the error
                      //? based on the [failure.code]

                      Text(failure.name),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),

                    //retry button
                    TextButton(
                      onPressed: () async {
                        await onRetry();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                );
              },
            );
          });
    });
  }
}
