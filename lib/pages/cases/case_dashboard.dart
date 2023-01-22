import 'package:flutter/material.dart';

class CaseDashboard extends StatelessWidget {
  const CaseDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CASE STATS'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Case stats'),
      ),
    );
  }
}
