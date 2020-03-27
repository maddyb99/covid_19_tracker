import 'package:covid19tracker/dashboard/dashboard.dart';
import 'package:covid19tracker/splash/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/dash':(BuildContext context)=>DashBoard(),
      },
      home: SplashScreen(),
    );
  }
}