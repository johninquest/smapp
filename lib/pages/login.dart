import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smapp/shared/snackbar_messages.dart';
import 'package:smapp/utils/supabase/auth.dart';
import '../styles/colors.dart';
import '../utils/router.dart';
import 'dart:developer';
import 'nav_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                    const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 10.0),
                child: const Text(
                  'The management app for school counselors',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 0.5, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  margin: const EdgeInsets.only(bottom: 10.0, top: 40.0),
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextFormField(
                    controller: userId,
                    enabled: false,
                    decoration: const InputDecoration(labelText: 'UserId'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter userId';
                      }
                      return null;
                    },
                  )),
              Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  margin: const EdgeInsets.only(bottom: 20.0),
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextFormField(
                    controller: userPassword,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(labelText: 'Password'),
                    keyboardType: TextInputType.text,
                    enabled: false,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  )),
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                margin: const EdgeInsets.only(bottom: 8.0),
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  children: [
                    Checkbox(
                      // checkColor: Colors.white,
                      // fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value as bool;
                        });
                      },
                    ),
                    const Text('Remember me'),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.50,
                margin: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 10.0, bottom: 13.0),
                child: ElevatedButton(
                  onPressed: () {
                    SnackBarMessage()
                        .customErrorMessage('Under construction!', context);
                    /*  var authRequest = supabaseAuth.authenticateUser(
                        userId.text, userPassword.text);
                    authRequest
                        .then((value) => debugPrint('Login success => $value'))
                        .catchError((err) => debugPrint('Auth error => $err')); */
                    /* PageRouter().navigateToPage(const NavPage(), context); */
                    if (loginFormKey.currentState!.validate()) {
                      SnackBarMessage()
                          .customErrorMessage('Under construction!', context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      // primary: primaryColor,
                      ),
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, letterSpacing: 1.0),
                  ),
                ),
              ),
              const Divider(
                indent: 34,
                endIndent: 34,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.50,
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 13.0),
                child: OutlinedButton(
                  onPressed: () {
                    //  response.then((value) => log('Auth response => $value')).catchError((e) => log('Error => $e'));
                    // log('Response => $response');
                    /*  final Session? session = response.session;
                    final User? user = response.user; */

                    PageRouter().navigateToPage(const NavPage(), context);
                    /*   final auth = AuthService();
                    auth
                        .signInUserViaEmailAndPassword(
                            'audatest@web.de', 'TestAcc!49')
                        .then((value) => log('Got some response from auth')); */
                  },
                  child: const Text(
                    'Demo',
                    style: TextStyle(
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

  /*  _authenticateUser(String authName, authPassword) {
    var adminAuth = AuthService().verifyAdmin(authName, authPassword);
    if (adminAuth == 'auth_success') {
      String name = 'admin';
      String role = 'admin';
      String businessName = '';
      String businessLocation = '';
      storeCurrentUser(name, role, businessName, businessLocation);
      PageRouter().navigateToPage(HomePage(), context);
    } else {
      FirestoreService()
          .checkIfDocExists(authName)
          .then((DocumentSnapshot snapshot) {
        if (snapshot.exists) {
          Map<String, dynamic> _data = snapshot.data() as Map<String, dynamic>;
          String name = _data['name'] ?? '';
          String role = _data['role'] ?? '';
          String businessName = _data['business_name'] ?? '';
          String businessLocation = _data['city'] ?? '';
          storeCurrentUser(name, role, businessName, businessLocation);
          storeRememberMeUser(isChecked as bool, authName);
          PageRouter().navigateToPage(HomePage(), context);
        } else {
          showDialog(
              context: context, builder: (_) => ErrorDialog('Access denied!'));
        }
      }).catchError((e) {
        showDialog(
            context: context,
            builder: (_) => ErrorDialog(
                'Something went wrong.\n Please inform your manager!'));
      });
    }
  } */
}
