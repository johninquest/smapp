import 'package:flutter/material.dart';
import '../utils/router.dart';
import '../styles/colors.dart';
import 'cases/case_list.dart';
// import 'evaluations/evaluation_list.dart';
import 'home.dart';
import 'requests/requests_list.dart';
import 'students/student_list.dart';
// import 'dart:developer';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final pages = [
    const HomePage(),
    const CaseListPage(),
    const StudentListPage(),
    const RequestsListPage()
  ];

/*   @override
  void initState() {
    super.initState();
    final spHelper = SharedPreferenceHelper();
    spHelper.readData('navBarIndex').then((value) {
      if (value != null) {
        log('Index value => $value');
        currentIndex = int.tryParse(value) ?? 0;
      } else {
        log('Index value => $value');
      }
    });
  } */

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: const NavigationBarThemeData(
          /* indicatorColor: primaryColor
          backgroundColor: primaryColor */
          ),
      child: NavigationBar(
        // height: 60,
        selectedIndex: currentIndex ?? 0,
        onDestinationSelected: (index) => setState(() {
          currentIndex = index;
          PageRouter().navigateToPage(pages[index], context);
        }),
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: primaryColor,
              size: 25.0,
            ),
            label: 'Home',
          ),
          NavigationDestination(
              icon: Icon(
                Icons.folder_copy,
                color: primaryColor,
                size: 25.0,
              ),
              label: 'Cases'),
          /*  BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart,
              color: Colors.white,
              size: 25.0,
            ),
            label: 'Evaluations',
          ), */
          NavigationDestination(
            icon: Icon(
              Icons.group,
              color: primaryColor,
              size: 25.0,
            ),
            label: 'Students',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.notifications,
              color: primaryColor,
              size: 25.0,
            ),
            label: 'Requests',
          ),
        ],
        // onTap: (index) => afterTap(index),
      ),
    );
  }

  void afterTap(int currentIndex) {
    if (currentIndex == 0) {
      // log('To home page');
      PageRouter().navigateToPage(const HomePage(), context);
    }
    if (currentIndex == 1) {
      // log('To case list');
      PageRouter().navigateToPage(const CaseListPage(), context);
    }
    /*  if (currentIndex == 2) {
      // log('To evaluation list');
      PageRouter().navigateToPage(const EvaluationListPage(), context);
    } */
    if (currentIndex == 2) {
      // throw ('This is an error!');
      // log('To student list');
      PageRouter().navigateToPage(const StudentListPage(), context);
    }
    if (currentIndex == 3) {
      // throw ('This is an error!');
      // log('To student list');
      PageRouter().navigateToPage(const RequestsListPage(), context);
    }
    /* else {
      print('No where to go');
    } */
  }
}
