import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_state.freezed.dart';

@freezed
class ApiRequestState<T, E> with _$ApiRequestState<T, E> {
  const factory ApiRequestState.idle() = IDLE;

  const factory ApiRequestState.loading() = LOADING;

  const factory ApiRequestState.data({required T data}) = DATA<T, E>;

  const factory ApiRequestState.failed({required E reason}) = FAILED<T, E>;
}
