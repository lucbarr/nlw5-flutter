import 'package:flutter/material.dart';
import 'package:quiz_dev/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "quiz_dev",
      home: SplashPage(),
    );
  }
}
