import 'package:flutter/material.dart';
import 'package:smapp/shared/snackbar_messages.dart';
import '../services/router.dart';
import '../styles/colors.dart';
import 'home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('###',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              color: Colors.white,
            )),
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
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _userPassword = TextEditingController();
  bool? isChecked = false;

/*   @override
  void initState() {
    super.initState();
    final _spHelper = SharedPreferencesHelper();
    _spHelper.readData('loginId').then((value) {
      if (value != null) {
        _authenticateUser(value, '');
      }
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  margin: const EdgeInsets.only(bottom: 10.0, top: 40.0),
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextFormField(
                    controller: _userName,
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.text,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter Email';
                      }
                    },
                  )),
              Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  margin: const EdgeInsets.only(bottom: 20.0),
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextFormField(
                    controller: _userPassword,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(labelText: 'Password'),
                    keyboardType: TextInputType.text,
                    enabled: true,
                    /*                   validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter password';
                      }
                    }, */
                  )),
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                margin: const EdgeInsets.only(bottom: 20.0),
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
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
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    PageRouter().navigateToPage(const HomeScreen(), context);
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
              Container(
                width: MediaQuery.of(context).size.width * 0.50,
                height: 45.0,
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    // PageRouter().navigateToPage(const HomeScreen(), context);
                    SnackBarMessage().underConstruction(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                  ),
                  child: const Text(
                    'Sign in with Google',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        letterSpacing: 1.0),
                  ),
                ),
              ),
              /* Container(
                margin: EdgeInsets.only(top: 10.0),
                width: MediaQuery.of(context).size.width * 0.90,
                child: Image(
                  image: AssetImage('assets/images/btn_google_signin.png'),
                ),
              ), */
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
