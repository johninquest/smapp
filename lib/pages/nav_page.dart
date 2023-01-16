import 'package:flutter/material.dart';
import '../styles/colors.dart';
import 'cases/case_list.dart';
import 'home.dart';
import 'requests/requests_list.dart';
import 'students/student_list.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int currentIndex = 0;
  final pages = [
    const HomePage(),
    const CaseListPage(),
    const StudentListPage(),
    const RequestsListPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
            /* indicatorColor: primaryColor
          backgroundColor: primaryColor */
            ),
        child: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (index) => setState(() {
            currentIndex = index;
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
        ),
      ),
      body: pages[currentIndex],
    );
  }
}
