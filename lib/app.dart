import 'package:flutter/material.dart';
import 'test_ui/screens/login_screen.dart';
import 'view/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: /*LoginScreen()*/HomeScreen(),
    );
  }
}
