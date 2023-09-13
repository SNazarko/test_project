import 'package:dio/dio.dart';

import '../../domain/models/user_search_model.dart';
import '../../presentation/utils/constants.dart';
import '../network_service/api_service.dart';

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
      final queryParameters = {
        "q": "$repoName in:name",
        "per_page": 15,
      };
      Response? response = await get(
        UrlConstants.searchUrl,
        queryParameters: queryParameters,

      );
      final map = response!.data as Map<String, dynamic>;
      final data = map['items'];
      final searchList =
          (data as List).map((item) => UserSearchModel.fromMap(item)).toList();
      return (
        isSuccess: true,
        getSearch: searchList,
        error: null,
      );
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
