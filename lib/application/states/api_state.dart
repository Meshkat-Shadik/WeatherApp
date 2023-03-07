import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_state.freezed.dart';

@freezed
class ApiRequestState<T> with _$ApiRequestState<T> {
  const factory ApiRequestState.idle() = IDLE;

  const factory ApiRequestState.loading() = LOADING;

  const factory ApiRequestState.data({required T data}) = DATA;

  const factory ApiRequestState.failed({required String reason}) = FAILED;
}
