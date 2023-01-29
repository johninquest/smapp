import 'package:flutter/material.dart';
import '../shared/snackbar_messages.dart';
import '../styles/colors.dart';
import '../utils/router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'evaluations/evaluation_calculator.dart';
import 'home.dart';
import 'login.dart';

final supabase = Supabase.instance.client;

class StartOptionsPage extends StatelessWidget {
  const StartOptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counseye',
            style: TextStyle(letterSpacing: 1.0, color: primaryColor)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final loginFormKey = GlobalKey<FormState>();
  final TextEditingController userId = TextEditingController();
  final TextEditingController userPassword = TextEditingController();
  bool? isChecked = false;

/*late final StreamSubscription<AuthState> _authSubscription;
 User? _user;

  @override
  void initState() {
    _authSubscription = supabase.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;
      setState(() {
        _user = session?.user;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    // final supabaseAuth = SupabaseAuth();
    return Form(
      key: loginFormKey,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin:
                    const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 34.0),
                child: const Text(
                  'The management app for school counselors',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 0.5, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 13.0),
                child: OutlinedButton(
                  onPressed: () {
                    PageRouter().navigateToPage(const LoginPage(), context);
                  },
                  child: const Text(
                    'Proceed to user login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, letterSpacing: 1.0),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 13.0),
                child: OutlinedButton(
                  onPressed: () {
                    PageRouter().navigateToPage(const HomePage(), context);
                  },
                  child: const Text(
                    'Use demo version',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, letterSpacing: 1.0),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 13.0),
                child: OutlinedButton(
                  onPressed: () {
                    PageRouter()
                        .navigateToPage(const EvaluationCalculator(), context);
                  },
                  child: Text(
                    'average calculator'.toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, letterSpacing: 1.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
