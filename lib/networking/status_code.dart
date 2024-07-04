enum StatusCode {
  badRequest(code: 400, name: 'Bad Request'),
  unauthorized(code: 401, name: 'Unauthorized'),
  forbidden(code: 403, name: 'Forbidden'),
  notFound(code: 404, name: 'Not Found'),
  conflict(code: 409, name: 'Conflict'),
  tokenExpired(code: 419, name: 'Token Expired'),
  unprocessableEntity(code: 422, name: 'Unprocessable Entity'),
  internalServerError(code: 500, name: 'Internal Server Error'),
  unrecognized(code: 0, name: 'Unrecognized error');

  final int code;
  final String name;

  const StatusCode({
    required this.code,
    required this.name,
  });
}

StatusCode? getStatusCode(int? code) {
  return switch (code) {
    400 => StatusCode.badRequest,
    401 => StatusCode.unauthorized,
    403 => StatusCode.forbidden,
    404 => StatusCode.notFound,
    409 => StatusCode.conflict,
    419 => StatusCode.tokenExpired,
    422 => StatusCode.unprocessableEntity,
    500 => StatusCode.internalServerError,
    null => null,
    _ => StatusCode.unrecognized,
  };
}
