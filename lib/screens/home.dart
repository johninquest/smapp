import 'package:flutter/material.dart';
import 'package:smapp/screens/left_nav_bar.dart';

import 'bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      drawer: const LeftMenu(),
      body: const Center(
        child: Text('Welcome to the home screen!'),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
