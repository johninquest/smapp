import 'package:flutter/material.dart';
import '../bottom_nav_bar.dart';

class CaseListPage extends StatelessWidget {
  const CaseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Case list'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Case list!'),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
