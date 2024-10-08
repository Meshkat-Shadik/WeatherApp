import 'package:dio/dio.dart';
import 'package:weather_app/src/core/failure/app_failure.dart';
import 'package:weather_app/src/core/failure/local_failure.dart';
import 'package:weather_app/src/core/failure/network_failure.dart';
import 'package:weather_app/src/core/helper/colored_logger.dart';

class FailureMapper {
  static AppFailure getFailures(Exception error) {
    if (error is DioException) {
      ColoredLogger.Red.log("DioException: $error");
      return NetworkFailure.getDioException(error);
    } else {
      return LocalFailure.fromException(error);
    }
  }
}
