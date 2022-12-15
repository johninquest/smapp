import 'package:flutter/material.dart';
import 'package:smapp/pages/cases/add_case.dart';
import 'package:smapp/services/router.dart';
import 'package:smapp/styles/colors.dart';
import '../../styles/style.dart';
import '../bottom_nav_bar.dart';

class CaseListPage extends StatelessWidget {
  const CaseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Case list',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Case list!'),
      ),
      bottomNavigationBar: const BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: const Tooltip(
          message: 'Add new case',
          child: Icon(
            Icons.add,
          ),
        ),
        onPressed: () =>
            PageRouter().navigateToPage(const AddCasePage(), context),
      ),
    );
  }
}
