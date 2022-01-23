import 'package:flutter/material.dart';
import 'package:sparrow_news_app/screens/login_screen.dart';
import 'package:sparrow_news_app/utils/routes.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
