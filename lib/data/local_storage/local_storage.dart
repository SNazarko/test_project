import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/enums/enums.dart';
import '../../domain/models/user_search_model.dart';

final class LocalStorage {
  void saveToCache({
    required List<UserSearchModel> data,
    required Storage storage,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = data.map((user) => user.toMap()).toList();
    prefs.setString(_getStorage(storage), json.encode(jsonData));
  }

  Future<
      ({
        String? error,
        List<UserSearchModel> getSearch,
        bool isSuccess,
      })> getFromCache({
    required Storage storage,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_getStorage(storage));

    if (jsonString != null) {
      final jsonData = json.decode(jsonString) as List<dynamic>;
      final searchHistory =
          jsonData.map((item) => UserSearchModel.fromMap(item)).toList();
      return (
        isSuccess: true,
        getSearch: searchHistory,
        error: null,
      );
    } else {
      return (
        isSuccess: true,
        getSearch: <UserSearchModel>[],
        error: 'error',
      );
    }
  }

  String _getStorage(
    Storage storage,
  ) {
    if (storage == Storage.history) {
      return 'search_history';
    } else if (storage == Storage.favorite) {
      return 'search_favorite';
    } else {
      return 'search_history';
    }
  }
}
