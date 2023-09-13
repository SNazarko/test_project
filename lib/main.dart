import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.light(),
      initialRoute: SplashPage.routeName,
      onGenerateRoute: AppRouter.generateRoute,
      routes: {
        SplashPage.routeName: (_) => const SplashPage(),
      },
    );
  }
}
