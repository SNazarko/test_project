import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/enums/enums.dart';
import '../../domain/models/user_search_model.dart';
import '../../domain/usecases/get_search_git_usecase.dart';
import '../../domain/usecases/get_storage_cache_usecase.dart';
import '../../domain/usecases/save_storage_cache_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IGetSearchGitUsecase _getSearchGitUsecase;
  final IGetStorageCacheUsecase _getStorageCacheUsecase;
  final ISaveStorageCacheUsecase _saveStorageCacheUsecase;
  HomeCubit(
    this._getSearchGitUsecase,
    this._getStorageCacheUsecase,
    this._saveStorageCacheUsecase,
  ) : super(const HomeState());

  Future<void> init() async {
    final resultStorageHistory =
        await _getStorageCacheUsecase.call(storage: Storage.history);
    final resultStorageFavorite =
        await _getStorageCacheUsecase.call(storage: Storage.favorite);
    emit(state.copyWith(
      historyList: resultStorageHistory.getSearch,
      favoriteList: resultStorageFavorite.getSearch,
    ));
  }

  Future<void> addFavorite(UserSearchModel model) async {
    if (!state.favoriteList.any((element) => element.id == model.id)) {
      final List<UserSearchModel> newFavoriteList =
          List<UserSearchModel>.from(state.favoriteList);
      newFavoriteList.insert(0, model.copyWith(isFavorite: true));
      await _saveStorageCacheUsecase.call(
          data: newFavoriteList, storage: Storage.favorite);
      emit(state.copyWith(
        status: BlocStatus.loaded,
        favoriteList: newFavoriteList,
      ));
    }
  }

  Future<void> dellFavorite(UserSearchModel model) async {
    final List<UserSearchModel> newFavoriteList =
        List<UserSearchModel>.from(state.favoriteList);
    final int indexOfModel =
        newFavoriteList.indexWhere((element) => element.id == model.id);

    if (indexOfModel != -1) {
      newFavoriteList.removeAt(indexOfModel);
      await _saveStorageCacheUsecase.call(
          data: newFavoriteList, storage: Storage.favorite);
    }
    emit(state.copyWith(
      status: BlocStatus.loaded,
      favoriteList: newFavoriteList,
    ));
  }

  Future getSearch(String value) async {
    emit(_loadingState());
    final List<UserSearchModel> newHistoryList =
    List<UserSearchModel>.from(state.historyList);
    final result = await _getSearchGitUsecase.call(repoName: value);
    if (result.isSuccess) {
      newHistoryList.addAll(result.getSearch);
      final List<UserSearchModel> reversed = newHistoryList.reversed.toList();
      await _saveStorageCacheUsecase.call(data: reversed, storage: Storage.history);
      emit(state.copyWith(
        status: BlocStatus.loaded,
        searchList: result.getSearch,
      ));
    } else {
      emit(_onError(result.error));
    }
  }

  HomeState _loadingState() => state.copyWith(
        status: BlocStatus.loading,
      );

  HomeState _onError(String? error) {
    return state.copyWith(
      status: BlocStatus.error,
      error: error,
    );
  }
}
