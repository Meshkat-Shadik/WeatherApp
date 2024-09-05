import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/core/failure/app_failure.dart';
part 'api_state.freezed.dart';

@freezed
sealed class ApiRequestState<T> with _$ApiRequestState<T> {
  const factory ApiRequestState.idle() = IDLE;

  const factory ApiRequestState.loading() = LOADING;

  const factory ApiRequestState.data({required T data}) = DATA<T>;

  const factory ApiRequestState.failed({required AppFailure reason}) = FAILED;
}
