import 'package:flutter/material.dart';
import 'package:smapp/styles/colors.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: primaryColor,
        brightness: Brightness.light,
        // useMaterial3: true
        // primarySwatch: Colors.indigo,
        // textButtonTheme: TextButtonThemeData(style: ButtonStyle(colo))
      ),
      home: const HomeScreen(),
    );
  }
}
