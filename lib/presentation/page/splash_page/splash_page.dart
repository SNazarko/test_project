import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/presentation/theme/app_colors.dart';
import '../../bloc/home_cubit.dart';
import '../home_page/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    context.read<HomeCubit>().init();
    _setInitialData();
    super.initState();
  }
  void _setInitialData() {
    Timer(
      const Duration(milliseconds: 3000),
          () {
        return _navigateToPage(HomePage.routeName);
      },
    );
  }

  void _navigateToPage(String route) {
    Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
      route,
          (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accentPrimary ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Text('Search App',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(
                    color: AppColors.layer),
              ),
            ),
          ),
          const CupertinoActivityIndicator(
            color: AppColors.layer,
            radius: 12.0,
          ),
        ],
      ),
    );
  }
}
