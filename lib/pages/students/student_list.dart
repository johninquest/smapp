import 'package:flutter/material.dart';
import 'package:smapp/styles/colors.dart';
import '../bottom_nav_bar.dart';

class StudentListPage extends StatelessWidget {
  const StudentListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student list'),
        centerTitle: true,
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
