part of 'home_cubit.dart';
class HomeState extends Equatable {
  const HomeState ({
    this.status = BlocStatus.initial,
    this.searchList = const [],
    this.favoriteList = const [],
    this.historyList = const [],
    this.error,
  });

  final BlocStatus status;
 final List<UserSearchModel> searchList;
 final List<UserSearchModel> favoriteList;
 final List<UserSearchModel> historyList;
  final String? error;

  @override

  List<Object?> get props => [
    status,
    searchList,
    favoriteList,
    historyList,
    error,
  ];

  HomeState copyWith({
    BlocStatus? status,
    List<UserSearchModel>? searchList,
    List<UserSearchModel>? favoriteList,
    List<UserSearchModel>? historyList,
    String? error,
  }) {
    return HomeState(
      status: status ?? this.status,
      searchList: searchList ?? this.searchList,
      favoriteList: favoriteList ?? this.favoriteList,
      historyList: historyList ?? this.historyList,
      error: error ?? this.error,
    );
  }
}