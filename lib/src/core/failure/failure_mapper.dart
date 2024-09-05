import 'package:dio/dio.dart';
import 'package:weather_app/failure/app_failure.dart';
import 'package:weather_app/failure/local_failure.dart';
import 'package:weather_app/failure/network_failure.dart';
import 'package:weather_app/helper/colored_logger.dart';

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
