import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/core/failure/app_failure.dart';

part 'local_failure.freezed.dart';

@freezed
class LocalFailure with _$LocalFailure implements AppFailure {
  const factory LocalFailure({
    required String name,
    required String message,
    String? uriPath,
    int? code,
  }) = _LocalFailure;

  factory LocalFailure.fromException(dynamic e) {
    String errorMessage = e.toString();
    String errorName = e.runtimeType.toString();
    if (e is Exception) {
      if (e is LocalFailure) {
        errorMessage = e.message;
        errorName = e.name;
      } else {
        errorMessage = (e.toString().split(':').lastOrNull ?? '').trim();
        errorName = e.runtimeType.toString() == '_Exception'
            ? 'Exception'
            : e.runtimeType.toString();
      }
    } else {
      if (e is AssertionError) {
        errorMessage = e.message.toString();
      } else if (e is ArgumentError) {
        errorMessage = '${e.message}: ${e.invalidValue.toString()}';
      } else if (e is RangeError) {
        errorMessage = '${e.message.toString()}: ${e.invalidValue.toString()}';
      } else if (e is IndexError) {
        errorMessage = '${e.message.toString()}: ${e.invalidValue.toString()}';
      } else if (e is NoSuchMethodError) {
        errorMessage = e.toString();
      } else if (e is UnsupportedError) {
        errorMessage = e.message ?? 'Unsupported operation';
      } else if (e is UnimplementedError) {
        errorMessage = e.message ?? 'Unimplemented';
      } else if (e is StateError) {
        errorMessage = e.message;
      } else if (e is ConcurrentModificationError) {
        errorMessage = e.toString();
      } else if (e is OutOfMemoryError) {
        errorMessage = 'Out of memory';
      } else if (e is StackOverflowError) {
        errorMessage = 'Stack overflow';
      }
    }

    return LocalFailure(
      name: errorName,
      message: errorMessage,
    );
  }
}
