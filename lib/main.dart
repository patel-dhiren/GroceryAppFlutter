import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/routing/app_route.dart';
import 'package:grocery_app/themes/app_theme.dart';

import 'constants/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyAmk0-1f2MEC3NXJlnLifvsWKPY0fUo1QE',
        appId: '1:371003238477:android:965b3885407a583b09d404',
        messagingSenderId: '371003238477',
        projectId: 'grocery-app-flutter-3df3c',
      storageBucket: 'grocery-app-flutter-3df3c.appspot.com'
    ),
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
