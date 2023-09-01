import '../models/user_search_model.dart';

abstract interface class IGitHabRepository {
  Future<
      ({
        bool isSuccess,
        List<UserSearchModel> getSearch,
        String? error,
      })> searchName({
    required String repoName,
  });
}
