import 'package:flutter/material.dart';
import 'package:medicine_finder/screen/home/home_screen.dart';
import 'package:medicine_finder/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'دارویاب',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          color: Color(0xFF0066AA)
        )
      ),
      home: const HomeScreen(),
    );
  }
}
