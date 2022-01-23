import 'package:flutter/material.dart';
import 'package:sparrow_news_app/screens/login_screen.dart';
import 'package:sparrow_news_app/screens/news_feed_screen.dart';
import 'package:sparrow_news_app/utils/routes.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.newsFeedRoute:
        return MaterialPageRoute(builder: (_) => const NewsFeedScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
