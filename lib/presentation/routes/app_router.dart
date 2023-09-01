import 'package:flutter/material.dart';
import '../page/favorite_page/favorite_page.dart';
import '../page/home_page/home_page.dart';
import '../page/splash_page/splash_page.dart';


class AppRouter {
  AppRouter._();
  static Route<dynamic> generateRoute(RouteSettings settings) {

    WidgetBuilder builder;

    switch (settings.name) {
      case SplashPage.routeName:
        builder = (_) => const SplashPage();
        break;
        case HomePage.routeName:
        builder = (_) => const HomePage();
        break;
      case FavoritePage.routeName:
        builder = (_) =>  FavoritePage();
        break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}