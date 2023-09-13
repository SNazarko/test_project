import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/domain/enums/enums.dart';
import 'package:test_project/presentation/page/home_page/widgets/custom_appbar_home.dart';
import 'package:test_project/presentation/theme/app_colors.dart';
import 'package:test_project/dependency_injection.dart' as di;
import '../../widgets/custom_text_field.dart';
import '../../widgets/item_list.dart';
import '../../bloc/home_cubit.dart' as cubit;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit.HomeCubit homeCubit = di.getIt.get();
  final FocusNode _focus = FocusNode();
  final TextEditingController _controller = TextEditingController();
  bool _isVisible = true;

  @override
  void initState() {
    _focus.addListener(() {
      if (_focus.hasFocus) {
        setState(() {
          _isVisible = false;
        });
      } else {
        setState(() {
          _isVisible = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarHome(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              focus: _focus,
              controller: _controller,
              onEditingComplete: () {
                if (_controller.text.isNotEmpty) {
                  homeCubit.getSearch(_controller.text);
                }
              },
            ),
            _isVisible
                ? BlocBuilder<cubit.HomeCubit, cubit.HomeState>(
                    bloc: homeCubit,
                    builder: (context, state) {
                      print(state.status);
                      if (state.status == BlocStatus.initial) {
                        return Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: Text(
                                  'Search History',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.copyWith(
                                          color: AppColors.accentPrimary),
                                ),
                              ),
                              state.favoriteList.isNotEmpty
                                  ? Expanded(
                                      child: ListView.builder(
                                        itemCount: state.historyList.length,
                                        itemBuilder: (context, index) {
                                          return ItemList(
                                            model: state.historyList[index],
                                          );
                                        },
                                      ),
                                    )
                                  : Expanded(
                                      child: Center(
                                        child: Text(
                                          'You have empty history.\nClick on search to start journey!',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                  color: AppColors
                                                      .textPlaceholder),
                                        ),
                                      ),
                                    )
                            ],
                          ),
                        );
                      } else if (state.status == BlocStatus.loaded) {
                        if (state.searchList.isEmpty) {
                          return Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16.0,
                                  ),
                                  child: Text(
                                    'What we found',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(
                                            color: AppColors.accentPrimary),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      'Nothing was find for your search. \nPlease check the spelling',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              color: AppColors.textPlaceholder),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        } else {
                          return Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16.0,
                                  ),
                                  child: Text(
                                    'What we have found',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(
                                            color: AppColors.accentPrimary),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: state.searchList.length,
                                    itemBuilder: (context, index) {
                                      return ItemList(
                                        model: state.searchList[index],
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                      } else if (state.status == BlocStatus.loading) {
                        return const SizedBox(
                            height: 50.0,
                            width: double.infinity,
                            child: Center(child: CupertinoActivityIndicator()));
                      } else if (state.status == BlocStatus.error) {
                        return Expanded(child: Text(state.error ?? ''));
                      } else {
                        return const SizedBox();
                      }
                    },
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
