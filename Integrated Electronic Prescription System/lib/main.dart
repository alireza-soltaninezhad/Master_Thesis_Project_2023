import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insurance/screen/login_screen.dart';
import 'package:insurance/util/shared_pref_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static SharedPreferencesUtil? prefs;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Insurance',
        debugShowCheckedModeBanner: false,
        builder: FToastBuilder(),
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: LoginScreen(),
      );
  }
}
