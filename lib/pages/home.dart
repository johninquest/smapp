import 'package:flutter/material.dart';
import '../shared/dialogs.dart';
import 'bottom_nav_bar.dart';
import 'left_nav_bar.dart';
// import 'dart:developer';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => showDialog(
                context: context,
                builder: (_) => const LogoutDialog(),
                barrierDismissible: true),
            icon: const Icon(Icons.logout_outlined),
            tooltip: 'Log out',
          )
        ],
      ),
      drawer: const LeftMenu(),
      body: const Center(
        child: Text('Welcome to the home screen!'),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
