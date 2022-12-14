import 'package:flutter/material.dart';
import '../bottom_nav_bar.dart';

class CaseDetailPage extends StatelessWidget {
  const CaseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new case'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Add case page'),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
