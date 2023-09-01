import '../models/user_search_model.dart';
import '../repositories/i_github_repository.dart';

abstract interface class IGetSearchGitUsecase {
  Future<({bool isSuccess, List<UserSearchModel> getSearch, String? error})>
      call({
    required String repoName,
  });
}

final class GetSearchGitUsecase implements IGetSearchGitUsecase {
  final IGitHabRepository repository;

  GetSearchGitUsecase(this.repository);

  @override
  Future<
      ({
        String? error,
        List<UserSearchModel> getSearch,
        bool isSuccess,
      })> call({required String repoName}) async {
    return await repository.searchName(
      repoName: repoName,
    );
  }
}
