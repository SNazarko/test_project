// import 'dart:convert';
//
// import 'package:dio/dio.dart';
//
// final class AuthorizationInterceptor extends Interceptor {
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) async {
//     if (err.response != null && err.response!.statusCode == 401) {
//       await _refreshToken().then((token) async {
//         if (token != null) {
//           return handler.resolve(await _retry(err.requestOptions, token));
//         } else {
//           handler.reject(err);
//         }
//       });
//     } else {
//       handler.reject(err);
//     }
//   }
//
//   Future<String?> _refreshToken() async {
//     final session = await AppDatabase.instance.getSession();
//     Options options = Options(
//       headers: {
//         Headers.contentTypeHeader: AppConstants.mainContentType,
//         AppConstants.authorizationHeader: '${AppConstants.bearerParam}${session!.bearerToken}',
//       },
//     );
//     final body = {
//       'refresh_token': session.refreshToken,
//     };
//     Response? response = await NetworkService.instance.dio.post(
//       UrlConstants.apiRefreshToken,
//       data: json.encode(body),
//       options: options,
//     );
//     if (response.statusCode == 200) {
//       final map = response.data as Map<String, dynamic>;
//       final data = map["data"]["bearer_token"] as String;
//       final cache = await AppDatabase.instance.getSession();
//       AppDatabase.instance.saveSession(cache!.copyWith(bearerToken: data));
//       return data;
//     } else {
//       return null;
//     }
//   }
//
//   Future<Response<dynamic>> _retry(RequestOptions requestOptions, String bearerToken) async {
//     var headers = requestOptions.headers;
//     if (requestOptions.headers.containsKey(AppConstants.authorizationHeader)) {
//       headers[AppConstants.authorizationHeader] = '${AppConstants.bearerParam}$bearerToken';
//     }
//     final options = Options(
//       method: requestOptions.method,
//       headers: headers,
//     );
//     return NetworkService.instance.dio.request<dynamic>(
//       requestOptions.path,
//       data: requestOptions.data,
//       queryParameters: requestOptions.queryParameters,
//       options: options,
//     );
//   }
// }
