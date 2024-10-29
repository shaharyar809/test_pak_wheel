import 'package:flutter/material.dart';

import '../view/screens/home_screen.dart';
import 'screens/login_screen.dart';

// import '../screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: /*LoginScreen()*/HomeScreen(),
    );
  }
}
