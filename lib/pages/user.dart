import 'package:flutter/material.dart';
import 'package:smapp/pages/bottom_nav_bar.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
        centerTitle: true,
      ),
      body: const UserForm(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('User data goes here!'));
  }
}
