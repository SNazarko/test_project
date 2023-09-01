import '../enums/enums.dart';
import '../models/user_search_model.dart';
import '../repositories/i_storage_repository.dart';

abstract interface class ISaveStorageCacheUsecase {
  call({
    required List<UserSearchModel> data,
    required Storage storage,
  });
}

final class SaveStorageCacheUsecase implements ISaveStorageCacheUsecase {
  final IStorageRepository repository;

  SaveStorageCacheUsecase(this.repository);

  @override
  call({
    required List<UserSearchModel> data,
    required Storage storage,
  }) {
    return repository.saveToCache(
      data: data,
      storage: storage,
    );
  }
}
