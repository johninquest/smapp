import 'dart:developer';

import 'package:flutter/material.dart';
import '../../styles/colors.dart';
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
  final _addCaseFormKey = GlobalKey<FormState>();

  final TextEditingController _givenNames = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  String? _role;
/* 
  final List<Map<String, dynamic>> _items = List.generate(
      5,
      (index) => {
            'id': index,
            'title': 'Item $index',
            'description':
                'This is the description of the item $index. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            'isExpanded': false
          }); */

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          /*   Container(
            child: const Text('Case information'),
          ), */
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: ExpansionPanelList(
              elevation: 3,
              // Controlling the expansion behavior
              expansionCallback: (index, isExpanded) {
                setState(() {
                  _items[index]['isExpanded'] = !isExpanded;
                });
              },
              animationDuration: const Duration(milliseconds: 600),
              children: _items
                  .map(
                    (item) => ExpansionPanel(
                      canTapOnHeader: true,
                      /* backgroundColor: item['isExpanded'] == true
                          ? Colors.cyan[100]
                          : Colors.white, */
                      headerBuilder: (_, isExpanded) => Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          child: Text(
                            item['title'],
                            style: const TextStyle(fontSize: 20),
                          )),
                      body: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: TextFormField(
                          // initialValue: 'Name',
                          decoration:
                              const InputDecoration(label: Text('Name')),
                        ),
                      ),
                      isExpanded: item['isExpanded'],
                    ),
                  )
                  .toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, letterSpacing: 1.0),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    log('Tapped save button!');
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  child: const Text(
                    'SAVE',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, letterSpacing: 1.0),
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
      ),
    );
  }

  final List<Map<String, dynamic>> _items = List.generate(
      5,
      (index) => {
            'id': index,
            'title': 'Item $index',
            'description':
                'This is the description of the item $index. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            'isExpanded': false
          });
  final List<ExpansionPanel> items = [
    ExpansionPanel(
      canTapOnHeader: true,
      /* backgroundColor:
          item['isExpanded'] == true ? Colors.cyan[100] : Colors.white, */
      headerBuilder: (_, isExpanded) => Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: const Text(
            'title 0',
            style: TextStyle(fontSize: 20),
          )),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: const Text('description 0'),
      ),
      isExpanded: false,
    ),
    ExpansionPanel(
      canTapOnHeader: true,
      /* backgroundColor:
          item['isExpanded'] == true ? Colors.cyan[100] : Colors.white, */
      headerBuilder: (_, isExpanded) => Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: const Text(
            'title 1',
            style: TextStyle(fontSize: 20),
          )),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: const Text('description 1'),
      ),
      isExpanded: false,
    ),
  ];
}
