import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/routing/app_route.dart';
import 'package:grocery_app/themes/app_theme.dart';

import 'constants/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyCbhPeDncItRtCDqlHbz07sJv-OUAxlGa0',
        appId: '1:570297416659:android:770d7fd93fdf8466dd8d26',
        messagingSenderId: '570297416659',
        projectId: 'grocerystoreapp-fa367'),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: AppConstant.splashView,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
