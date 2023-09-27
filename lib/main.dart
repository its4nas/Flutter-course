import 'package:first_test/second.dart';
import 'package:flutter/material.dart';
import 'MainPage.dart';
import 'first.dart';
import 'second.dart';
import 'Home.dart';
import 'signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage()
    );
  }
}
