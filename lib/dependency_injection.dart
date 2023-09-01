

import 'package:get_it/get_it.dart';
import 'package:test_project/presentation/bloc/home_cubit.dart';

import 'data/local_storage/local_storage.dart';
import 'data/remote_storage/github_service.dart';
import 'data/repositories/github_repository.dart';
import 'data/repositories/storage_repository.dart';
import 'domain/repositories/i_github_repository.dart';
import 'domain/repositories/i_storage_repository.dart';
import 'domain/usecases/get_search_git_usecase.dart';
import 'domain/usecases/get_storage_cache_usecase.dart';
import 'domain/usecases/save_storage_cache_usecase.dart';

final getIt = GetIt.instance;

void setup() {
  // // SERVICES
  getIt
    ..registerLazySingleton<GitHubService>(
      () => GitHubService(),
     )
    // STORAGE
    ..registerLazySingleton<LocalStorage>(
      () => LocalStorage(),
    )
    // REPOSITORIES
    ..registerLazySingleton<IGitHabRepository>(
      () => GitHubRepository(
        getIt.get(),
      ),
    )
    ..registerLazySingleton<IStorageRepository>(
      () => StorageRepository(
        getIt.get(),
      ),
    )


    // USE CASES
    ..registerLazySingleton<IGetSearchGitUsecase>(
      () => GetSearchGitUsecase(
        getIt.get(),
      ),
    )
    ..registerLazySingleton<IGetStorageCacheUsecase>(
      () => GetStorageCacheUsecase(
        getIt.get(),
      ),
    )
    ..registerLazySingleton<ISaveStorageCacheUsecase>(
      () => SaveStorageCacheUsecase(
        getIt.get(),
      ),
    )

    // BLOC

    ..registerLazySingleton<HomeCubit>(
      () => HomeCubit(
        getIt.get(),
        getIt.get(),
        getIt.get(),
      ),
    );

}
