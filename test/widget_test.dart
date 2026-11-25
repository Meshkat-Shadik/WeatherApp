import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/common/state/api_result.dart';
import 'package:weather_app/core/failure/app_failure.dart';
import 'package:weather_app/core/failure/local_failure.dart';

String describe(ApiResult<String> state) => switch (state) {
  ApiInitial() => 'initial',
  ApiLoading() => 'loading',
  ApiSuccess(:final data) => 'data:$data',
  ApiError(:final failure) => 'failed:${failure.name}',
};

void main() {
  test('ApiResult is exhaustively pattern-matchable', () {
    expect(describe(const ApiInitial()), 'initial');
    expect(describe(const ApiLoading()), 'loading');
    expect(describe(const ApiSuccess('Dhaka')), 'data:Dhaka');
    expect(
      describe(const ApiError(AppFailure(message: 'm', name: 'Timeout'))),
      'failed:Timeout',
    );
  });

  test('Equatable value equality and typed copyWith', () {
    const a = LocalFailure(name: 'X', message: 'm');
    expect(a, const LocalFailure(name: 'X', message: 'm'));
    expect(a == const AppFailure(name: 'X', message: 'm'), isFalse);
    final b = a.copyWith(message: 'n');
    expect(b, isA<LocalFailure>());
    expect(b.message, 'n');
    expect(const ApiSuccess(1), const ApiSuccess(1));
  });

  test('LocalFailure maps Errors as well as Exceptions', () {
    expect(LocalFailure.fromException(StateError('bad')).message, 'bad');
    expect(LocalFailure.fromException(Exception('boom')).name, 'Exception');
  });
}
