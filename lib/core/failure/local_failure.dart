import 'package:weather_app/core/failure/app_failure.dart';

class const LocalFailure({required super.name, required super.message})
    extends AppFailure {
  factory LocalFailure.fromException(Object? e) => switch (e) {
    LocalFailure() => e,
    AssertionError(:final message) => LocalFailure(
      name: 'AssertionError',
      message: '$message',
    ),
    ArgumentError(:final message, :final invalidValue) => LocalFailure(
      name: e.runtimeType.toString(),
      message: '$message: $invalidValue',
    ),
    StateError(:final message) => LocalFailure(
      name: 'StateError',
      message: message,
    ),
    UnsupportedError(:final message) => LocalFailure(
      name: 'UnsupportedError',
      message: message ?? 'Unsupported operation',
    ),
    Exception() => LocalFailure(
      name: switch (e.runtimeType.toString()) {
        '_Exception' => 'Exception',
        final type => type,
      },
      message: (e.toString().split(':').lastOrNull ?? '').trim(),
    ),
    _ => LocalFailure(name: e.runtimeType.toString(), message: '$e'),
  };

  @override
  LocalFailure copyWith({
    String? message,
    String? name,
    int? code,
    String? uriPath,
  }) => LocalFailure(name: name ?? this.name, message: message ?? this.message);
}
