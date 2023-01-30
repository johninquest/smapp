import 'package:flutter/material.dart';
import '../shared/dialogs.dart';
import '../shared/version.dart';
import '../styles/colors.dart';
import '../utils/router.dart';
import '../utils/web.dart';
import 'bottom_nav_bar.dart';
import 'cases/case_list.dart';
import 'evaluations/evaluation_list.dart';
import 'left_nav_bar.dart';
import 'requests/requests_list.dart';
import 'students/student_list.dart';
// import 'dart:developer';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SupabaseService().tableSize('students');
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceBetween,
          spacing: 32.0,
          runSpacing: 64.0,
          children: [
            GestureDetector(
              onTap: () =>
                  PageRouter().navigateToPage(const CaseListPage(), context),
              child: Card(
                elevation: 21.0,
                // color: Colors.deepOrange,
                child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'CASES',
                          style: TextStyle(
                              color: primaryColor, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TableSize(
                          tableName: 'cases',
                        )
                      ],
                    )),
              ),
            ),
            GestureDetector(
              onTap: () => PageRouter()
                  .navigateToPage(const EvaluationsListPage(), context),
              child: Card(
                elevation: 21.0,
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(3.0),
                    height: 100,
                    width: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'EVALUATIONS',
                          style: TextStyle(
                              color: primaryColor, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TableSize(
                          tableName: 'evaluations',
                        )
                      ],
                    )),
              ),
            ),
            GestureDetector(
              onTap: () => PageRouter()
                  .navigateToPage(const RequestsListPage(), context),
              child: Card(
                elevation: 21.0,
                // color: Colors.tealAccent,
                child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'REQUESTS',
                          style: TextStyle(
                              color: primaryColor, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TableSize(
                          tableName: 'requests',
                        )
                      ],
                    )),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  PageRouter().navigateToPage(const StudentListPage(), context),
              child: Card(
                elevation: 21.0,
                child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'STUDENTS',
                          style: TextStyle(
                              color: primaryColor, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TableSize(
                          tableName: 'students',
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 55.0),
          child: const VersionInfo(),
        )
      ],
    );
  }
}

class TableSize extends StatelessWidget {
  final String tableName;
  const TableSize({super.key, required this.tableName});

  @override
  Widget build(BuildContext context) {
    final reqData = SupabaseService().fetchData(tableName);
    return FutureBuilder(
      future: reqData,
      builder: ((context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Container(
            padding: const EdgeInsets.all(3.0),
            child: const Center(
              child: Text('An error occured!'),
            ),
          );
        }
        if (snapshot.hasData) {
          List<dynamic> sbData = snapshot.data as List;
          int? rowCount = sbData.length;
          return Text(
            '$rowCount',
            style: const TextStyle(fontSize: 20.0),
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
