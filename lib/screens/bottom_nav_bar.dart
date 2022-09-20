import 'package:flutter/material.dart';
import '../services/router.dart';
import '../styles/colors.dart';
import 'home.dart';

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
          label: 'STARTSEITE',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.timer_outlined,
            color: Colors.white,
            size: 25.0,
          ),
          label: 'ZEIT ERFASSEN',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt,
              color: Colors.white,
              size: 25.0,
            ),
            label: 'AUFZEICHNUNGEN'),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.analytics_outlined,
            color: Colors.white,
            size: 25.0,
          ),
          label: 'AUSWERTUNGEN',
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
      // PageRouter().navigateToPage(AutoTimingPage(), context);
      // ignore: avoid_print
      print('Tapped button');
    }
    if (currentIndex == 2) {
      // PageRouter().navigateToPage(TimingDataPage(), context);
      // ignore: avoid_print
      print('Tapped button');
    }
    if (currentIndex == 3) {
      // PageRouter().navigateToPage(AnalysisOverviewPage(), context);
      // ignore: avoid_print
      print('Tapped button');
    }
    /* else {
      print('No where to go');
    } */
  }
}
