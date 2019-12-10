import 'package:login/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'screens/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tienda',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Splash(),
    );
  }

}