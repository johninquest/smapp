import 'package:flutter/material.dart';
import 'package:smapp/pages/bottom_nav_bar.dart';

class AddCasePage extends StatelessWidget {
  const AddCasePage({super.key});

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
