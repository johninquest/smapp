import 'package:flutter/material.dart';
import 'package:smapp/shared/snackbar_messages.dart';
import '../../shared/lists.dart';
import '../../styles/colors.dart';
import '../../styles/style.dart';
import '../../utils/date_time_helper.dart';

class AddStudentPage extends StatelessWidget {
  const AddStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new student', style: appBarTitleStyle),
        centerTitle: true,
      ),
      body: const Center(
        child: AddStudentForm(),
      ),
    );
  }
}

class AddStudentForm extends StatefulWidget {
  const AddStudentForm({super.key});

  @override
  State<AddStudentForm> createState() => _AddStudentFormState();
}

class _AddStudentFormState extends State<AddStudentForm> {
  final _studentFormKey = GlobalKey<FormState>();
  final TextEditingController _registrationNr = TextEditingController();
  final TextEditingController _givenNames = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _pickedDate = TextEditingController();
  final TextEditingController _age = TextEditingController();

  String? _classNumber;
  String? _classLetter;
  String? _gender;
  // String? _age;

  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1970, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != currentDate) {
      setState(() {
        currentDate = picked;
        _pickedDate.text = DateTimeHelper().dateToCmrDateString(picked);
        _age.text = DateTimeHelper().ageFromDate(picked);
        // print('Picked date => $picked');
        // log('Age => $_age');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    //  _pickedDate.text = DateTimeHelper().dateToCmrDateString(DateTime.now());
    _pickedDate.text = '--/--/----';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _studentFormKey,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.95,
              margin: const EdgeInsets.only(bottom: 5.0),
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: TextFormField(
                controller: _registrationNr,
                enabled: true,
                decoration:
                    const InputDecoration(labelText: 'Registration number'),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                validator: (val) =>
                    val!.isEmpty ? 'Please enter registration number' : null,
                /* onChanged: (val) => setState(() {
                  surname = val;
                }), */
              )),
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
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  margin: const EdgeInsets.only(right: 10.0),
                  padding: const EdgeInsets.only(left: 15.0),
                  child: DropdownButtonFormField(
                    decoration:
                        const InputDecoration(labelText: 'Class number'),
                    items: AppData().classNumberList,
                    validator: (val) => val == null ? 'Class number ?' : null,
                    onChanged: (val) => setState(() {
                      _classNumber = val as String?;
                    }),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  margin: const EdgeInsets.only(left: 10.0),
                  padding: const EdgeInsets.only(right: 15.0),
                  child: DropdownButtonFormField(
                    decoration:
                        const InputDecoration(labelText: 'Class letter'),
                    items: AppData().classLetterList,
                    /* validator: (val) =>
                          val == null ? 'Please select payment method' : null, */
                    onChanged: (val) => setState(() {
                      _classLetter = val as String?;
                    }),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    margin: const EdgeInsets.only(right: 10.0),
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextFormField(
                      controller: _pickedDate,
                      enabled: true,
                      readOnly: true,
                      decoration:
                          const InputDecoration(labelText: 'Date of birth'),
                      onTap: () => _selectDate(context),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width * 0.30,
                    margin: const EdgeInsets.only(left: 10.0),
                    padding: const EdgeInsets.only(right: 15.0),
                    child: TextFormField(
                      // initialValue: _age,
                      controller: _age,
                      enabled: false,
                      decoration: const InputDecoration(labelText: 'Age'),
                    )),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            margin: const EdgeInsets.only(bottom: 5.0),
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: DropdownButtonFormField(
              decoration: const InputDecoration(labelText: 'Sex'),
              items: AppData().genderList,
              validator: (val) => val == null ? ' Please enter sex?' : null,
              onChanged: (val) => setState(() {
                _classNumber = val as String?;
              }),
            ),
          ),
          /*  Container(
              width: MediaQuery.of(context).size.width * 0.95,
              margin: const EdgeInsets.only(bottom: 5.0),
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: TextFormField(
                controller: _email,
                enabled: true,
                decoration: const InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
              )), */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  /* style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, 
                  ), */
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(letterSpacing: 1.0, color: textBlackColor),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () => SnackBarMessage().underConstruction(context),
                  /* style:
                      ElevatedButton.styleFrom(backgroundColor: primaryColor), */
                  child: const Text(
                    'SAVE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
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
    ;
  }
}
