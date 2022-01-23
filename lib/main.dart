import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sparrow_news_app/utils/app_strings.dart';
import 'package:sparrow_news_app/utils/custom_router.dart';
import 'package:sparrow_news_app/utils/routes.dart';

FirebaseOptions get firebaseOptions => const FirebaseOptions(
      appId: '1:756941742705:android:7ce841006e2dd1100b71d0',
      apiKey: "AIzaSyBxFIQoWvuTQcJjn4uKJt-s4_cpWTFHFME",
      projectId: 'sparrownewsapp',
      messagingSenderId: '448618578101',
    );

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: firebaseOptions,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.loginRoute,
      onGenerateRoute: CustomRouter.allRoutes,
    );
  }
}
