import 'package:flutter/material.dart';
import 'package:smapp/styles/colors.dart';
import '../../styles/style.dart';
import '../../utils/router.dart';
import '../bottom_nav_bar.dart';
import 'add_student.dart';

class StudentListPage extends StatelessWidget {
  const StudentListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student list',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: const Tooltip(
          message: 'Add new student',
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        onPressed: () =>
            PageRouter().navigateToPage(const AddStudentPage(), context),
      ),
      body: const Center(
        child: Text(
          'Students list!',
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
