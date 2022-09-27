import 'package:flutter/material.dart';
import '../services/router.dart';
import '../styles/colors.dart';
import 'cases/case_list.dart';
import 'evaluations/evaluation_list.dart';
import 'home.dart';
import 'students/student_list.dart';
import 'dart:developer';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
      log('To home page');
      PageRouter().navigateToPage(const HomeScreen(), context);
    }
    if (currentIndex == 1) {
      // throw ('This is an error!');
      log('To student list');
      PageRouter().navigateToPage(const StudentListPage(), context);
    }
    if (currentIndex == 2) {
      log('To case list');
      PageRouter().navigateToPage(const CaseListPage(), context);
    }
    if (currentIndex == 3) {
      log('To evaluation list');
      PageRouter().navigateToPage(const EvaluationListPage(), context);
    }
    /* else {
      print('No where to go');
    } */
  }
}