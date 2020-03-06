import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger Concept',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF37C8F8),
        accentColor: Color(0xFFE4FCFF),
      ),
      home: HomeScreen(),
    );
  }
}
