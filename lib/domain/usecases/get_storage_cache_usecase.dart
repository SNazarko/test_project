import '../enums/enums.dart';
import '../models/user_search_model.dart';
import '../repositories/i_storage_repository.dart';

abstract interface class IGetStorageCacheUsecase {
  Future<
      ({
        String? error,
        List<UserSearchModel> getSearch,
        bool isSuccess,
      })> call({
    required Storage storage,
  });
}

final class GetStorageCacheUsecase implements IGetStorageCacheUsecase {
  final IStorageRepository repository;

  GetStorageCacheUsecase(this.repository);

  @override
  Future<
      ({
        String? error,
        List<UserSearchModel> getSearch,
        bool isSuccess,
      })> call({
    required Storage storage,
  }) async {
    return await repository.getFromCache(
      storage: storage,
    );
  }
}
