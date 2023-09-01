import 'package:dio/dio.dart';

import '../../domain/models/user_search_model.dart';
import '../../presentation/utils/constants.dart';

final class GitHubService {
  Future<
      ({
        bool isSuccess,
        List<UserSearchModel> getSearch,
        String? error,
      })> searchName({
    required String repoName,
  }) async {
    try {
      final dio = Dio();
      final headers = {
        "Authorization": "token ${UrlConstants.apiToken}",
      };
      final queryParameters = {
        "q": "$repoName in:name",
        "per_page": 15,
      };
      final Response response = await dio.get(
        UrlConstants.searchUrl,
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        final data = response.data['items'];
        final searchList = (data as List)
            .map((item) => UserSearchModel.fromMap(item))
            .toList();
        return (
          isSuccess: true,
          getSearch: searchList,
          error: null,
        );
      } else {
        final String? message = response.data['message'];
        return (
          isSuccess: false,
          getSearch: <UserSearchModel>[],
          error: message,
        );
      }
    } on DioError catch (e) {
      final String message = "Помилка запиту: $e";
      return (
        isSuccess: false,
        getSearch: <UserSearchModel>[],
        error: message,
      );
    }
  }
}
