import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

final class AppLogger {
  AppLogger._();

  static final AppLogger instance = AppLogger._();
  final logger = Logger();
}

class LogNetworkInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    AppLogger.instance.logger.e('HTTP ERROR: ${err.requestOptions.path}\n${err.response}');
    // await CustomFirebaseService.instance.recordError(
    //   err.response!.data,
    //   err.stackTrace,
    //   reason: err.requestOptions.path,
    //   printDetails: true,
    // );
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    AppLogger.instance.logger.i('HTTP REQUEST: ${options.path}\n${options.queryParameters}\n${options.headers}\n${options.data}');
    if (options.data is FormData) {
      AppLogger.instance.logger.i('${(options.data as FormData).fields}\n${(options.data as FormData).files.first.value}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger.instance.logger.i('HTTP RESPONSE: ${response.requestOptions.path}\n${response.data}');
    super.onResponse(response, handler);
  }
}
