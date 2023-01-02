import 'package:flutter/material.dart';
import '../shared/dialogs.dart';
import '../styles/colors.dart';
import '../utils/router.dart';
import '../utils/web.dart';
import 'bottom_nav_bar.dart';
import 'cases/case_list.dart';
import 'left_nav_bar.dart';
import 'requests/requests_list.dart';
import 'students/student_list.dart';
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
      direction: Axis.horizontal,
      alignment: WrapAlignment.spaceBetween,
      spacing: 32.0,
      runSpacing: 64.0,
      children: [
        GestureDetector(
          onTap: () =>
              PageRouter().navigateToPage(const CaseListPage(), context),
          child: Card(
            elevation: 20.0,
            // color: Colors.deepOrange,
            child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 120,
                child: Text(
                  'Cases'.toUpperCase(),
                  style: const TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                )),
          ),
        ),
        const RequestData(),
        GestureDetector(
          onTap: () =>
              PageRouter().navigateToPage(const StudentListPage(), context),
          child: Card(
            elevation: 20.0,
            child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 120,
                child: Text(
                  'Students'.toUpperCase(),
                  style: const TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                )),
          ),
        ),
        Card(
          elevation: 20.0,
          child: Container(
              alignment: Alignment.center,
              height: 100,
              width: 120,
              child: const Text(
                'Other(s)',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              )),
        ),
      ],
    );
  }
}

class RequestData extends StatelessWidget {
  const RequestData({super.key});

  @override
  Widget build(BuildContext context) {
    final reqData = SupabaseService().fetchData();
    return FutureBuilder(
      future: reqData,
      builder: ((context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('An error occured!'),
          );
        }
        if (snapshot.hasData) {
          List<dynamic> sbData = snapshot.data as List;
          // return TableOfContactRequests(tableData: sbData);
          return GestureDetector(
            onTap: () => PageRouter()
                .navigateToPage(const RequestsForCounselingPage(), context),
            child: Card(
              elevation: 20.0,
              // color: Colors.tealAccent,
              child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Requests'.toUpperCase(),
                        style: const TextStyle(
                            color: primaryColor, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '${sbData.length}',
                        style: const TextStyle(fontSize: 20.0),
                      )
                    ],
                  )),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
