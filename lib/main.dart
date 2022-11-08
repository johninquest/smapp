import 'package:flutter/material.dart';
import 'package:smapp/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorSchemeSeed: primaryColor,
        brightness: Brightness.light,
        // useMaterial3: true,
        // primarySwatch: Colors.indigo,
        // textButtonTheme: TextButtonThemeData(style: ButtonStyle(colo))
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      home: const LoginPage(),
    );
  }
}
