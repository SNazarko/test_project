import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/presentation/page/favorite_page/widgets/custom_appbar_favorite.dart';
import 'package:test_project/dependency_injection.dart' as di;
import '../../theme/app_colors.dart';
import '../../widgets/item_list.dart';
import '../../bloc/home_cubit.dart' as cubit;

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);
  static const routeName = '/favorite_page';
  final cubit.HomeCubit homeCubit = di.getIt.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarFavorite(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 16.0,
        ),
        child: BlocBuilder<cubit.HomeCubit, cubit.HomeState>(
          bloc: homeCubit,
          builder: (context, state) {
            if (state.favoriteList.isNotEmpty) {
              return ListView.builder(
                itemCount: state.favoriteList.length,
                itemBuilder: (context, index) {
                  return ItemList(
                    model: state.favoriteList[index],
                    isFavorite: true,
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  'Nothing was find for your search.\nPlease check the spelling',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.textPlaceholder),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
