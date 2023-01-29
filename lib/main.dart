import 'package:flutter/material.dart';
import 'pages/start_options.dart';
import 'styles/colors.dart';
/* import 'package:supabase_flutter/supabase_flutter.dart'; */

void main() {
/*   WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SupabaseCred().projUrl,
    anonKey: SupabaseCred().projAnonKey,
  ); */
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
        useMaterial3: true,
        // primarySwatch: Colors.indigo,
        // textButtonTheme: TextButtonThemeData(style: ButtonStyle(colo))
        // textTheme: GoogleFonts.quicksandTextTheme(),
        fontFamily: 'Quicksand',
        // textTheme: const TextTheme(bodyText2: TextStyle(color: textBlackColor)),
      ),
      home: const StartOptionsPage(),
    );
  }
}

/* Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SupabaseCred().projUrl,
    anonKey: SupabaseCred().projAnonKey,
  );
  runApp(const MyApp());
} */

class SupabaseCred {
  final String projUrl = 'https://cyifcmqsbowqfnwycvjk.supabase.co';
  final String projAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN5aWZjbXFzYm93cWZud3ljdmprIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjgwOTI2NDUsImV4cCI6MTk4MzY2ODY0NX0.nuI2Y6NO_QusYOJwW3u-h97wpxu5xcznsg7CGbYuq00';
}
