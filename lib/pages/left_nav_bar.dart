import 'package:flutter/material.dart';
import '../services/router.dart';
import '../styles/colors.dart';
import 'about.dart';
import 'school/school_info.dart';
import 'user.dart';

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
                decoration: const BoxDecoration(color: primaryColor),
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
/*             ListTile(
              leading: const Icon(
                Icons.group_outlined,
                color: primaryColor,
              ),
              title: const Text(
                'Students',
                style: TextStyle(color: primaryColor),
              ),
              onTap: () {
                // ignore: avoid_print
                print('Tapped students button');
                return;
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.cases_outlined,
                color: primaryColor,
              ),
              title: const Text(
                'Cases',
                style: TextStyle(color: primaryColor),
              ),
              // ignore: avoid_returning_null_for_void
              onTap: () => {},
            ), */
            ListTile(
                leading: const Icon(
                  Icons.school_outlined,
                  color: primaryColor,
                ),
                title: const Text(
                  'School',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  PageRouter().navigateToPage(const SchoolInfoPage(), context);
                }),
            ListTile(
              leading: const Icon(
                Icons.manage_accounts_outlined,
                color: primaryColor,
              ),
              title: const Text(
                'User',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
              onTap: () =>
                  PageRouter().navigateToPage(const UserPage(), context),
            ),
            const SizedBox(
              height: 25.0,
            ),
            ListTile(
              leading: const Icon(
                Icons.info_outline,
                color: primaryColor,
              ),
              title: const Text(
                'Info',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
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
                  color: primaryColor,
                ),
                title: Text(
                  'Users',
                  style: TextStyle(color: primaryColor),
                ),
                onTap: () =>
                    PageRouter().navigateToPage(UserListPage(), context),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: primaryColor,
              ),
              title: Text(
                'Log out',
                style: TextStyle(color: primaryColor),
              ),
              onTap: () {
                // FirebaseAuthService().logoutUser();
                SharedPreferencesHelper().removeData('currentUserData');
                PageRouter().navigateToPage(LoginPage(), context);
              },
            ), */
