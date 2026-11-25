import 'package:equatable/equatable.dart';

class const AppFailure({
  required final String message,
  required final String name,
  final int? code,
  final String? uriPath,
}) extends Equatable implements Exception {
  AppFailure copyWith({
    String? message,
    String? name,
    int? code,
    String? uriPath,
  }) => AppFailure(
    message: message ?? this.message,
    name: name ?? this.name,
    code: code ?? this.code,
    uriPath: uriPath ?? this.uriPath,
  );

  @override
  List<Object?> get props => [message, name, code, uriPath];

  @override
  bool get stringify => true;
}
