import 'package:dio/dio.dart';
import 'package:weather_app/helper/colored_logger.dart';

class CancelInterceptor extends Interceptor {
  final List<String> _ignoredEndpoints;

  final _cancelTokens = <String, CancelToken>{};
  final _timestamps = <String, DateTime>{};

  // Create a list of regular expressions from the _ignoredEndpoints list
  late final List<RegExp> _ignoredRegexps;

  CancelInterceptor.withIgnoredEndpoints(this._ignoredEndpoints) {
    // Initialize the _ignoredRegexps variable in the constructor body
    _ignoredRegexps =
        _ignoredEndpoints.map((endpoint) => RegExp(endpoint)).toList();
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final key = options.baseUrl + options.path;

    // Check if the endpoint matches any of the regular expressions in the _ignoredRegexps list
    if (!(_ignoredRegexps.any((regexp) => regexp.hasMatch(key)))) {
      // Cancel the previous request if it was made less than 500ms ago
      if (_timestamps.containsKey(key) &&
          DateTime.now().difference(_timestamps[key]!) <
              const Duration(milliseconds: 500)) {
        _cancelTokens[key]?.cancel();
        ColoredLogger.White.log('❕❕❌🚫Cancelled previous request to $key🚫❌❕❕');
      }

      // Create a new CancelToken for the new request
      _cancelTokens[key] = CancelToken();
      options.cancelToken = _cancelTokens[key];

      // Update the timestamp for the new request
      _timestamps[key] = DateTime.now();
    }

    super.onRequest(options, handler);
  }
}
