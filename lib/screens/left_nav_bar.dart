import 'package:flutter/material.dart';
import 'package:smapp/screens/home.dart';
import '../services/router.dart';
import '../styles/colors.dart';
import 'about.dart';

class LeftMenu extends StatefulWidget {
  const LeftMenu({Key? key}) : super(key: key);

  @override
  State<LeftMenu> createState() => _LeftMenuState();
}

class _LeftMenuState extends State<LeftMenu> {
  String? _currentUserName;
  @override
  Widget build(BuildContext context) {
    /*  SharedPreferencesHelper().readData('currentUserData').then((val) {
      if (val != null) {
        setState(() {
          _currentUserName = DataParser().strToMap(val)['name'];
        });
      }
    }); */
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: myBlue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50.0,
                    ),
                    Text(
                      _currentUserName ?? '',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    )
                  ],
                )),
            ListTile(
              leading: Icon(
                Icons.group_outlined,
                color: myBlue,
              ),
              title: Text(
                'Students',
                style: TextStyle(color: myBlue),
              ),
              onTap: () {
                // ignore: avoid_print
                print('Tapped students button');
                return;
              },
            ),
            ListTile(
              leading: Icon(
                Icons.cases_outlined,
                color: myBlue,
              ),
              title: Text(
                'Cases',
                style: TextStyle(color: myBlue),
              ),
              // ignore: avoid_returning_null_for_void
              onTap: () => {},
            ),
            ListTile(
                leading: Icon(
                  Icons.school_outlined,
                  color: myBlue,
                ),
                title: Text(
                  'School',
                  style: TextStyle(color: myBlue),
                ),
                onTap: () {
                  // ignore: avoid_print
                  print('Tapped school button!');
                }),
            ListTile(
              leading: Icon(
                Icons.info_outline,
                color: myBlue,
              ),
              title: Text(
                'Info',
                style: TextStyle(color: myBlue),
              ),
              onTap: () =>
                  PageRouter().navigateToPage(const AboutPage(), context),
            ),
          ],
        ),
      ),
    );
  }
}

// How to log out of firebase

            /* Visibility(
              visible: _isVisible,
              child: ListTile(
                leading: Icon(
                  Icons.person_outline,
                  color: myBlue,
                ),
                title: Text(
                  'Users',
                  style: TextStyle(color: myBlue),
                ),
                onTap: () =>
                    PageRouter().navigateToPage(UserListPage(), context),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: myBlue,
              ),
              title: Text(
                'Log out',
                style: TextStyle(color: myBlue),
              ),
              onTap: () {
                // FirebaseAuthService().logoutUser();
                SharedPreferencesHelper().removeData('currentUserData');
                PageRouter().navigateToPage(LoginPage(), context);
              },
            ), */
