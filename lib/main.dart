import 'package:eportfolio/screens/home_screen.dart';
import 'package:eportfolio/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Prompt',
      ),
      title: 'ePortfolio',
      home: Login(),
    );
  }
}
