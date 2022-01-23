import 'package:flutter/material.dart';
import 'package:sparrow_news_app/utils/custom_router.dart';
import 'package:sparrow_news_app/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sparrow News',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Container(),
        initialRoute: AppRoutes.loginRoute,
        onGenerateRoute: CustomRouter.allRoutes);
  }
}
