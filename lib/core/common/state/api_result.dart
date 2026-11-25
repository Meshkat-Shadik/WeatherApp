import 'package:equatable/equatable.dart';
import 'package:weather_app/core/failure/app_failure.dart';

/// initial → loading → success(data) | error(failure). Subclasses are public
/// so call sites pattern-match with an exhaustive `switch`.
sealed class ApiResult<T> extends Equatable {
  const ApiResult();

  @override
  List<Object?> get props => const [];
}

final class ApiInitial<T> extends ApiResult<T> {
  const ApiInitial();
}

final class ApiLoading<T> extends ApiResult<T> {
  const ApiLoading();
}

final class const ApiSuccess<T>(final T data) extends ApiResult<T> {
  @override
  List<Object?> get props => [data];
}

final class const ApiError<T>(final AppFailure failure) extends ApiResult<T> {
  @override
  List<Object?> get props => [failure];
}
