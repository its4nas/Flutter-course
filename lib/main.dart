import 'package:first_test/login.dart';
import 'package:first_test/show.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
import 'MainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ez',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(profile: null,)
    );
  }
}
