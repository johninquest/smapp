import 'package:flutter/material.dart';
import '../../styles/style.dart';
import '../bottom_nav_bar.dart';

class AddCasePage extends StatelessWidget {
  const AddCasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add new case',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: AddCaseForm(),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class AddCaseForm extends StatefulWidget {
  const AddCaseForm({super.key});

  @override
  State<AddCaseForm> createState() => _AddCaseFormState();
}

class _AddCaseFormState extends State<AddCaseForm> {
  int _currentStep = 0;
  final _addCaseFormKey = GlobalKey<FormState>();

  final TextEditingController _givenNames = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  String? _role;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Stepper(
        currentStep: _currentStep,
        onStepTapped: (index) => setState(() {
          _currentStep = index;
        }),
        onStepContinue: () {
          if (_currentStep != 4) {
            setState(() => _currentStep++);
          }
        },
        onStepCancel: () {
          if (_currentStep != 0) {
            setState(() => _currentStep--);
          }
        },
        steps: [
          Step(
              isActive: _currentStep >= 0,
              title: const Text('Student information'),
              content: const Text('Student info fields!')),
          Step(
              isActive: _currentStep >= 1,
              title: const Text('Parent information'),
              content: const Text('Parent info fields!')),
          Step(
              isActive: _currentStep >= 2,
              title: const Text('Problem'),
              content: const Text('Problem info fields!')),
          Step(
              isActive: _currentStep >= 3,
              title: const Text('Method'),
              content: const Text('Method info fields!')),
          Step(
              isActive: _currentStep >= 4,
              title: const Text('Solution'),
              content: const Text('Solution info fields!'))
        ],
      ),
    ));
  }
}
