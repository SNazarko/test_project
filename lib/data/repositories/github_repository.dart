import '../../domain/models/user_search_model.dart';
import '../../domain/repositories/i_github_repository.dart';
import '../remote_storage/github_service.dart';

final class GitHubRepository implements IGitHabRepository {
  final GitHubService service;
  GitHubRepository(
    this.service,
  );
  @override
  Future<
      ({
        String? error,
        List<UserSearchModel> getSearch,
        bool isSuccess,
      })> searchName({
    required String repoName,
  }) async {
    return await service.searchName(
      repoName: repoName,
    );
  }
}
