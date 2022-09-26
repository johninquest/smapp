import 'package:flutter/material.dart';
import '../services/router.dart';
import '../styles/colors.dart';
import 'cases/case_list.dart';
import 'evaluations/evaluation_list.dart';
import 'home.dart';
import 'students/student_list.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedIconTheme: const IconThemeData(color: Colors.black),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      // iconSize: 30,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
            color: Colors.white,
            size: 25.0,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.group_outlined,
            color: Colors.white,
            size: 25.0,
          ),
          label: 'Students',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.cases_outlined,
              color: Colors.white,
              size: 25.0,
            ),
            label: 'Cases'),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.bar_chart,
            color: Colors.white,
            size: 25.0,
          ),
          label: 'Evaluations',
        ),
      ],
      onTap: (index) => afterTap(index),
    );
  }

  void afterTap(int currentIndex) {
    if (currentIndex == 0) {
      PageRouter().navigateToPage(const HomeScreen(), context);
    }
    if (currentIndex == 1) {
      PageRouter().navigateToPage(const StudentListPage(), context);
      // ignore: avoid_print
      // print('Tapped button');
    }
    if (currentIndex == 2) {
      PageRouter().navigateToPage(const CaseListPage(), context);
      // ignore: avoid_print
      // print('Tapped button');
    }
    if (currentIndex == 3) {
      PageRouter().navigateToPage(const EvaluationListPage(), context);
      // ignore: avoid_print
      // print('Tapped button');
    }
    /* else {
      print('No where to go');
    } */
  }
}
