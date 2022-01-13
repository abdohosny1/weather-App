import 'package:flutter/material.dart';
import 'package:weather/feature/splash/view.dart';
import 'package:weather/screen/home.dart';

import 'core/router/router.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      home: SplashView(),
    );
  }
}
