import 'package:test_project/domain/enums/enums.dart';

import 'package:test_project/domain/models/user_search_model.dart';

import '../../domain/repositories/i_storage_repository.dart';
import '../local_storage/local_storage.dart';

final class StorageRepository implements IStorageRepository {
  final LocalStorage service;

  StorageRepository(
    this.service,
  );

  @override
  Future<
      ({
        String? error,
        List<UserSearchModel> getSearch,
        bool isSuccess,
      })> getFromCache({
    required Storage storage,
  }) async {
    return await service.getFromCache(
      storage: storage,
    );
  }

  @override
  void saveToCache({
    required List<UserSearchModel> data,
    required Storage storage,
  }) {
    return service.saveToCache(
      data: data,
      storage: storage,
    );
  }
}
