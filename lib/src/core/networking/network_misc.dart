typedef JSON = Map<String, dynamic>;

enum StatusCode {
  badRequest(code: 400, name: 'Bad Request'),
  unauthorized(code: 401, name: 'Unauthorized'),
  forbidden(code: 403, name: 'Forbidden'),
  notFound(code: 404, name: 'Not Found'),
  requestTimeout(code: 408, name: 'Request Timeout'),
  conflict(code: 409, name: 'Conflict'),
  tokenExpired(code: 419, name: 'Token Expired'),
  unprocessableEntity(code: 422, name: 'Unprocessable Entity'),
  internalServerError(code: 500, name: 'Internal Server Error'),
  badGateWay(code: 502, name: 'Bad Gateway'),
  serviceUnavailable(code: 503, name: 'Service Unavailable'),
  gatewayTimeout(code: 504, name: 'Gateway Timeout'),
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
    408 => StatusCode.requestTimeout,
    409 => StatusCode.conflict,
    419 => StatusCode.tokenExpired,
    422 => StatusCode.unprocessableEntity,
    500 => StatusCode.internalServerError,
    502 => StatusCode.badGateWay,
    503 => StatusCode.serviceUnavailable,
    504 => StatusCode.gatewayTimeout,
    null => null,
    _ => StatusCode.unrecognized,
  };
}

class NetworkMisc {
  const NetworkMisc._();

  static const tokenField = 'requiresAuthToken';

  static const needAuthToken = {
    'Content-Type': 'application/json',
    tokenField: true
  };
}
