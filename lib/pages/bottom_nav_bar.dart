import 'package:flutter/material.dart';
import '../utils/router.dart';
import '../styles/colors.dart';
import 'cases/case_list.dart';
import 'evaluations/evaluation_list.dart';
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

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      // height: 60,
      selectedIndex: currentIndex,
      onDestinationSelected: (index) => setState(() {
        currentIndex = index;
        /*  PageRouter().navigateToPage(pages[index], context); */
        afterTap(index);
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
        NavigationDestination(
            icon: Icon(
              Icons.assessment,
              color: primaryColor,
              size: 25.0,
            ),
            label: 'Evaluations'),
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
    );
  }

  void afterTap(int currentIndex) {
    if (currentIndex == 0) {
      PageRouter().navigateToPage(const HomePage(), context);
    }
    if (currentIndex == 1) {
      PageRouter().navigateToPage(const CaseListPage(), context);
    }
    if (currentIndex == 2) {
      PageRouter().navigateToPage(const EvaluationsListPage(), context);
    }

    if (currentIndex == 3) {
      PageRouter().navigateToPage(const StudentListPage(), context);
    }
    if (currentIndex == 4) {
      PageRouter().navigateToPage(const RequestsListPage(), context);
    }
  }
} 
/* 
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

      elevation: 1.0,
      /* selectedItemColor: blackColor,
      unselectedItemColor: blackColor,
      selectedIconTheme: IconThemeData(color: Colors.black), */
      showSelectedLabels: true,
      showUnselectedLabels: true,
      // iconSize: 30,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
            color: primaryColor,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.folder_copy,
            color: primaryColor,
          ),
          label: 'Cases',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.group,
            color: primaryColor,
          ),
          label: 'Students',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
            color: primaryColor,
          ),
          label: 'Requests',
        ),
      ],
      onTap: (index) => afterTap(index),
    );
  }

  void afterTap(int currentIndex) {
    if (currentIndex == 0) {
      PageRouter().navigateToPage(const HomePage(), context);
    }
    if (currentIndex == 1) {
      PageRouter().navigateToPage(const CaseListPage(), context);
    }

    if (currentIndex == 2) {
      PageRouter().navigateToPage(const StudentListPage(), context);
    }
    if (currentIndex == 3) {
      PageRouter().navigateToPage(const RequestsListPage(), context);
    }
  }
}
 */