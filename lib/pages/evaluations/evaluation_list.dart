import 'package:flutter/material.dart';
import '../../styles/colors.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Evaluation list'),
            SizedBox(
              height: 50.0,
            ),
            Text(
              'Still under construction!',
              style: TextStyle(color: warnColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
