import 'package:flutter/material.dart';
import 'package:smapp/pages/cases/case_list.dart';
import 'package:smapp/pages/requests/requests_list.dart';
import 'package:smapp/pages/students/student_list.dart';
import 'package:smapp/styles/colors.dart';
import 'package:smapp/utils/router.dart';
import '../shared/dialogs.dart';
import 'bottom_nav_bar.dart';
import 'left_nav_bar.dart';
// import 'dart:developer';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => showDialog(
                context: context,
                builder: (_) => const LogoutDialog(),
                barrierDismissible: true),
            icon: const Icon(Icons.logout_outlined),
            tooltip: 'Log out',
          )
        ],
      ),
      drawer: const LeftMenu(),
      body: const Center(child: HomeDashBoard()),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class HomeDashBoard extends StatefulWidget {
  const HomeDashBoard({super.key});

  @override
  State<HomeDashBoard> createState() => _HomeDashBoardState();
}

class _HomeDashBoardState extends State<HomeDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.spaceBetween,
      spacing: 32.0,
      runSpacing: 64.0,
      children: [
        Card(
          elevation: 20.0,
          // color: Colors.deepOrange,
          child: GestureDetector(
            onTap: () =>
                PageRouter().navigateToPage(const CaseListPage(), context),
            child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 120,
                child: const Text(
                  'Cases',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                )),
          ),
        ),
        GestureDetector(
          onTap: () => PageRouter()
              .navigateToPage(const RequestsForCounselingPage(), context),
          child: Card(
            elevation: 20.0,
            // color: Colors.tealAccent,
            child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 120,
                child: const Text(
                  'Requests',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                )),
          ),
        ),
        Card(
          elevation: 20.0,
          // color: Colors.brown,
          child: GestureDetector(
            onTap: () =>
                PageRouter().navigateToPage(const StudentListPage(), context),
            child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 120,
                child: const Text(
                  'Students',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                )),
          ),
        ),
      ],
    );
  }
}
