import 'package:flutter/material.dart';
import '../bottom_nav_bar.dart';

class SchoolInfoPage extends StatelessWidget {
  const SchoolInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School info'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('School info'),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
