import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/presentation/bloc/home_cubit.dart';
import 'package:test_project/presentation/page/splash_page/splash_page.dart';
import 'package:test_project/presentation/routes/app_router.dart';
import 'package:test_project/presentation/theme/app_themes.dart';
import 'package:test_project/dependency_injection.dart' as di;

void main() async {
  di.setup();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final HomeCubit homeCubit = di.getIt.get();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeCubit,
      child: MaterialApp(
        theme: AppThemes.light(),
        initialRoute: SplashPage.routeName,
        onGenerateRoute: AppRouter.generateRoute,
        routes: {
          SplashPage.routeName: (_) => SplashPage(),
        },
      ),
    );
  }
}
