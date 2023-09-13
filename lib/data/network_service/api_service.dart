import 'package:dio/dio.dart';

import '../../presentation/utils/constants.dart';
import 'network_service.dart';

Future<Response?> get(
  String path, {
  Map<String, dynamic>? queryParameters,
  Options? options,
  CancelToken? cancelToken,
  void Function(int, int)? onReceiveProgress,
  bool ignoreToken = false,
}) async {
  options?.headers ??= {};
  if (!ignoreToken) {
    options?.headers!["Authorization"] = "token ${UrlConstants.apiToken}";

  }
  options?.headers!["Timezone"] = DateTime.now().timeZoneName;
  Response response = await NetworkService.instance.dio
      .get(path, queryParameters: queryParameters, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress);
  return response;
}

Future<Response?> post(
  String path, {
  dynamic data,
  Map<String, dynamic>? queryParameters,
  Options? options,
  CancelToken? cancelToken,
  void Function(int, int)? onSendProgress,
  void Function(int, int)? onReceiveProgress,
  bool ignoreToken = false,
}) async {
  try {
    options?.headers ??= {};
    if (!ignoreToken) {
      options?.headers!["Authorization"] = userToken;
    }
    options?.headers!["Timezone"] = DateTime.now().timeZoneName;
    Response response = await NetworkService.instance.dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
    );
    return response;
  } on Exception catch (_) {}
  return null;
}

Future<Response?> delete(
  String path, {
  dynamic data,
  Map<String, dynamic>? queryParameters,
  Options? options,
  CancelToken? cancelToken,
  bool ignoreToken = false,
}) async {
  try {
    options?.headers ??= {};
    if (!ignoreToken) {
      options?.headers!["Authorization"] = userToken;
    }
    options?.headers!["Timezone"] = DateTime.now().timeZoneName;
    Response response = await NetworkService.instance.dio.delete(
      path,
      data: data,
      options: options,
      cancelToken: cancelToken,
      queryParameters: queryParameters,
    );
    return response;
  } on Exception catch (_) {}
  return null;
}

Future<Response?> patch(
  String path, {
  dynamic data,
  Map<String, dynamic>? queryParameters,
  Options? options,
  CancelToken? cancelToken,
  void Function(int, int)? onSendProgress,
  void Function(int, int)? onReceiveProgress,
  bool ignoreToken = false,
}) async {
  options?.headers ??= {};
  if (!ignoreToken) {
    options?.headers!["Authorization"] = userToken;
  }
  options?.headers!["Timezone"] = DateTime.now().timeZoneName;
  Response response = await NetworkService.instance.dio.patch(
    path,
    data: data,
    queryParameters: queryParameters,
    options: options,
    cancelToken: cancelToken,
    onSendProgress: onSendProgress,
    onReceiveProgress: onReceiveProgress,
  );
  return response;
}
