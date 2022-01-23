import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sparrow_news_app/utils/app_strings.dart';
import 'package:sparrow_news_app/utils/custom_router.dart';
import 'package:sparrow_news_app/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppStrings.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Container(),
        initialRoute: AppRoutes.loginRoute,
        onGenerateRoute: CustomRouter.allRoutes);
  }
}
