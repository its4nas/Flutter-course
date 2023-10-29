import 'package:first_test/view/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ez',
      theme: isDarkMode
          ? ThemeData.dark().copyWith(
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.grey[800],
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      )
          : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: LoginPage(toggleTheme: toggleTheme),
    );
  }
}
