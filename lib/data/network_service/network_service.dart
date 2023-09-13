import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../../presentation/utils/constants.dart';
import 'log_network_interceptor.dart';

final class NetworkService {
  NetworkService._() {
    dio = Dio(
      BaseOptions(
        baseUrl: UrlConstants.baseUrl,
      ),
    );
    dio.interceptors.addAll([
      LogNetworkInterceptor(),
      //AuthorizationInterceptor(),
     // alice.getDioInterceptor(),
    ]);
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  late final Dio dio;
  static final NetworkService instance = NetworkService._();
}
