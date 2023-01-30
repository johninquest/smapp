import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../styles/style.dart';
import '../bottom_nav_bar.dart';

class AddEvaluationPage extends StatelessWidget {
  const AddEvaluationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'new evaluation'.toUpperCase(),
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('New evaluation'),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class AddEvaluationForm extends StatefulWidget {
  const AddEvaluationForm({super.key});

  @override
  State<AddEvaluationForm> createState() => _AddEvaluationFormState();
}

class _AddEvaluationFormState extends State<AddEvaluationForm> {
  int _currentStep = 0;
  final _updateCaseFormKey = GlobalKey<FormState>();
  final TextEditingController _registrationNr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
