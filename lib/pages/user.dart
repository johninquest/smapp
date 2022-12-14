import 'package:flutter/material.dart';
import '../shared/lists.dart';
import '../styles/colors.dart';
import 'bottom_nav_bar.dart';
import 'dart:developer';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
        centerTitle: true,
      ),
      body: const Center(child: UserForm()),
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
  final userFormKey = GlobalKey<FormState>();
  final TextEditingController _givenNames = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  String? _role;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: userFormKey,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.95,
            margin: const EdgeInsets.only(bottom: 10.0),
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: DropdownButtonFormField(
              value: _role,
              isExpanded: true,
              decoration: const InputDecoration(labelText: 'Role'),
              items: AppData().userRoleList,
              validator: (val) => val == null ? 'Please select role' : null,
              onChanged: (val) => setState(() {
                _role = val as String?;
              }),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.95,
              margin: const EdgeInsets.only(bottom: 5.0),
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: TextFormField(
                controller: _surname,
                enabled: true,
                decoration: const InputDecoration(labelText: 'Surname'),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                validator: (val) =>
                    val!.isEmpty ? 'Please enter surname' : null,
                /* onChanged: (val) => setState(() {
                  surname = val;
                }), */
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.95,
              margin: const EdgeInsets.only(bottom: 5.0),
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: TextFormField(
                controller: _givenNames,
                enabled: true,
                decoration: const InputDecoration(labelText: 'Given names'),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                validator: (val) =>
                    val!.isEmpty ? 'Please enter given names' : null,
              )),
/*           Container(
              width: MediaQuery.of(context).size.width * 0.95,
              margin: const EdgeInsets.only(bottom: 5.0),
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: TextFormField(
                controller: _address,
                enabled: true,
                decoration: const InputDecoration(labelText: 'Address'),
                keyboardType: TextInputType.streetAddress,
                textCapitalization: TextCapitalization.words,
              )),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            margin: const EdgeInsets.only(bottom: 5.0),
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: TextFormField(
              controller: _city,
              enabled: true,
              decoration: const InputDecoration(
                labelText: 'City / Town',
              ),
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
            ),
          ), */
          Container(
              width: MediaQuery.of(context).size.width * 0.95,
              margin: const EdgeInsets.only(bottom: 5.0),
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: TextFormField(
                controller: _phone,
                enabled: true,
                decoration: const InputDecoration(labelText: 'Phone number'),
                keyboardType: TextInputType.phone,
                textCapitalization: TextCapitalization.words,
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.95,
              margin: const EdgeInsets.only(bottom: 5.0),
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: TextFormField(
                controller: _email,
                enabled: true,
                decoration: const InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    log('Tapped save button!');
                  },
                  style: ElevatedButton.styleFrom(primary: primaryColor),
                  child: const Text(
                    'SAVE',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              /* Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                    child: const Text('PRINT'),
                  )) */
            ],
          ),
        ],
      )),
    );
  }
}
