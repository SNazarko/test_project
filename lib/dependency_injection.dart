

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
  //   ..registerLazySingleton<OnboardingService>(
  //     () => OnboardingService(),
  //   )
  //   ..registerLazySingleton<AuthService>(
  //     () => AuthService(),
  //   )
  //   ..registerLazySingleton<ProfileService>(
  //     () => ProfileService(),
  //   )
  //   ..registerLazySingleton<LookupService>(
  //     () => LookupService(),
  //   )
  //   ..registerLazySingleton<CustomEntityService>(
  //     () => CustomEntityService(),
  //   )
  //   ..registerLazySingleton<LocationService>(
  //     () => LocationService(),
  //   )
  //   ..registerLazySingleton<ProductService>(
  //     () => ProductService(),
  //   )
  //   ..registerLazySingleton<ViewBlockService>(
  //     () => ViewBlockService(),
  //   )
  //   ..registerLazySingleton<FaqService>(
  //     () => FaqService(),
  //   )
  //   ..registerLazySingleton<FormService>(
  //     () => FormService(),
  //   )
  //
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
  //   ..registerLazySingleton<IOnboardingRepository>(
  //     () => OnboardingRepository(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IAuthRepository>(
  //     () => AuthRepository(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IProfileRepository>(
  //     () => ProfileRepository(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<ILookupRepository>(
  //     () => LookupRepository(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<ICustomEntityRepository>(
  //     () => CustomEntityRepository(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<ILocationRepository>(
  //     () => LocationRepository(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IProductRepository>(
  //     () => ProductRepository(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IViewBlockRepository>(
  //     () => ViewBlockRepository(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IFaqRepository>(
  //     () => FaqRepository(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IFormRepository>(
  //     () => FormRepository(
  //       getIt.get(),
  //     ),
  //   )
  //
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
  //   ..registerLazySingleton<IGetLanguagesUsecase>(
  //     () => GetLanguagesUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IGetLocalizationUsecase>(
  //     () => GetLocalizationUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IGetOnboardingEntitiesUsecase>(
  //     () => GetOnboardingEntitiesUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   //AUTH
  //   ..registerLazySingleton<IGetAuthGroupsUsecase>(
  //     () => GetAuthGroupsUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<ILoginUsecase>(
  //     () => LoginUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<ILogoutUsecase>(
  //     () => LogoutUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IGetRestoreSettingsUsecase>(
  //     () => GetRestoreSettingsUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<ISendRestoreCodeUsecase>(
  //     () => SendRestoreCodeUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IVerifyRestoreCodeUsecase>(
  //     () => VerifyRestoreCodeUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<ISetRestoredPasswordUsecase>(
  //     () => SetRestoredPasswordUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IGetRegistrationGroupsUsecase>(
  //     () => GetRegistrationGroupsUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IRegistrationSubmitUsecase>(
  //     () => RegistrationSubmitUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IGetConfigUsecase>(
  //     () => GetConfigUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IInitVerificationUsecase>(
  //     () => InitVerificationUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IVerifyContactUsecase>(
  //     () => VerifyContactUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   //PROFILE
  //   ..registerLazySingleton<IGetChangePasswordSettingsUsecase>(
  //     () => GetChangePasswordSettingsUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IChangePasswordUsecase>(
  //     () => ChangePasswordUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IGetUpdateProfileSettingsUsecase>(
  //     () => GetUpdateProfileSettingsUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<ISubmitEditProfileFormUsecase>(
  //     () => SubmitEditProfileFormUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IUploadFileUsecase>(
  //     () => UploadFileUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IGetAccountInfoUsecase>(
  //     () => GetAccountInfoUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<ISaveDeviceTokenUsecase>(
  //     () => SaveDeviceTokenUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IDeleteDeviceTokenUsecase>(
  //     () => DeleteDeviceTokenUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   //LOOKUP
  //   ..registerLazySingleton<IGetLookupUsecase>(
  //     () => GetLookupUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   //CUSTOM ENTITY
  //   ..registerLazySingleton<IGetCustomEntitiesUsecase>(
  //     () => GetCustomEntitiesUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   //LOCATION
  //   ..registerLazySingleton<IGetCountriesUsecase>(
  //     () => GetCountriesUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IGetRegionsUsecase>(
  //     () => GetRegionsUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IGetCitiesUsecase>(
  //     () => GetCitiesUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<IGetMapMarkersByCategoryUsecase>(
  //     () => GetMapMarkersByCategoryUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   //PRODUCTS
  //   ..registerLazySingleton<IGetProductsUsecase>(
  //     () => GetProductsUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   //VIEW BLOCK
  //   ..registerLazySingleton<IGetViewBlockUsecase>(
  //     () => GetViewBlockUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   //FAQ
  //   ..registerLazySingleton<IGetFaqQuestionsUsecase>(
  //     () => GetFaqQuestionsUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   //FORM
  //   ..registerLazySingleton<IGetFormUsecase>(
  //     () => GetFormUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<ISubmitFormUsecase>(
  //     () => SubmitFormUsecase(
  //       getIt.get(),
  //     ),
  //   )
  //
    // BLOC

    ..registerLazySingleton<HomeCubit>(
      () => HomeCubit(
        getIt.get(),
        getIt.get(),
        getIt.get(),
      ),
    );
  //   ..registerLazySingleton<InternetConnectionBloc>(
  //     () => InternetConnectionBloc(),
  //   )
  //   ..registerLazySingleton<OnboardingCubit>(
  //     () => OnboardingCubit(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<ProfileCubit>(
  //     () => ProfileCubit(
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<AuthCubit>(
  //     () => AuthCubit(
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<ViewBlockCubit>(
  //     () => ViewBlockCubit(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<MapCubit>(
  //     () => MapCubit(
  //       getIt.get(),
  //     ),
  //   )
  //   ..registerLazySingleton<FormCubit>(
  //     () => FormCubit(
  //       getIt.get(),
  //       getIt.get(),
  //     ),
  //   );
}
