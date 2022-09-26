import 'package:flutter/material.dart';
import '../bottom_nav_bar.dart';

class EvaluationListPage extends StatelessWidget {
  const EvaluationListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Evaluation list'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Evaluation list'),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
