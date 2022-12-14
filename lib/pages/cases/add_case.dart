import 'package:flutter/material.dart';
import '../bottom_nav_bar.dart';

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
        child: Text('Hello case!'),
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
  final _addCaseFormKey = GlobalKey<FormState>();

  final TextEditingController _givenNames = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  String? _role;
  List<bool> _isOpen = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addCaseFormKey,
      child: ExpansionPanelList(
        children: [
          ExpansionPanel(
              headerBuilder: (context, isOpen) {
                return const Text('Hello world!');
              },
              body: const Text('Now daadaaa!'),
              isExpanded: _isOpen[0])
        ],
        expansionCallback: (i, isOpen) => setState(() => _isOpen[i] = !isOpen),
      ),
    );
  }
}
