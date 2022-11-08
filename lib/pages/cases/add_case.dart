import 'package:flutter/material.dart';

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
    );
  }
}
