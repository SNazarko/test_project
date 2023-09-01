import '../enums/enums.dart';
import '../models/user_search_model.dart';

abstract interface class IStorageRepository {
  Future<
      ({
        bool isSuccess,
        List<UserSearchModel> getSearch,
        String? error,
      })> getFromCache({
    required Storage storage,
  });

  void saveToCache({
    required List<UserSearchModel> data,
    required Storage storage,
  });

}
