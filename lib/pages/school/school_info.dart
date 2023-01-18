import 'package:flutter/material.dart';
import '../../styles/style.dart';

class SchoolInfoPage extends StatelessWidget {
  const SchoolInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'school info'.toUpperCase(),
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('School info'),
      ),
      /* bottomNavigationBar: BottomNavBar(), */
    );
  }
}
