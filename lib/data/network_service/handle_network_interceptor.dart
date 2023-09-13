import 'package:dio/dio.dart';

final class HandleNetworkInterceptor extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["Timezone"] = DateTime.now().timeZoneName;
    super.onRequest(options, handler);
  }
}