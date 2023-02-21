import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../styles/style.dart';
import '../../utils/calculator.dart';
import '../bottom_nav_bar.dart';
import '../../shared/lists.dart';
import '../../shared/snackbar_messages.dart';
import '../../utils/date_time_helper.dart';

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
        child: AddEvaluationForm(),
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
  final addEvaluationFormKey = GlobalKey<FormState>();
  final TextEditingController _registrationNr = TextEditingController();
  final TextEditingController _givenNames = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _pickedDate = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _problemDetails = TextEditingController();
  final TextEditingController _firstTermOverallAverage =
      TextEditingController();
  final TextEditingController _secondTermOverallAverage =
      TextEditingController();
  final TextEditingController _thirdTermOverallAverage =
      TextEditingController();
  final TextEditingController _parentsOpinion = TextEditingController();
  final TextEditingController _parentsPhoneNumber = TextEditingController();

  String? _classNumber;
  String? _classLetter;
  String? _gender;

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
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _pickedDate.text = '--/--/----';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: addEvaluationFormKey,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stepper(
                currentStep: _currentStep,
                onStepTapped: (index) => setState(() {
                  _currentStep = index;
                }),
                onStepContinue: () {
                  if (_currentStep != 3) {
                    setState(() => _currentStep++);
                  }
                },
                onStepCancel: () {
                  if (_currentStep != 0) {
                    setState(() => _currentStep--);
                  }
                },
                physics: const ClampingScrollPhysics(),
                steps: [
                  Step(
                      isActive: _currentStep >= 0,
                      title: const Text('Student information'),
                      content: Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              margin: const EdgeInsets.only(bottom: 5.0),
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: TextFormField(
                                controller: _registrationNr,
                                enabled: true,
                                decoration: const InputDecoration(
                                    labelText: 'Registration number'),
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                /* validator: (val) => val!.isEmpty
                                    ? 'Please enter registration number'
                                    : null, */
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              margin: const EdgeInsets.only(bottom: 5.0),
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: TextFormField(
                                controller: _surname,
                                enabled: true,
                                decoration:
                                    const InputDecoration(labelText: 'Surname'),
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                validator: (val) => val!.isEmpty
                                    ? 'Please enter surname'
                                    : null,
                                /* onChanged: (val) => setState(() {
                  surname = val;
                }), */
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              margin: const EdgeInsets.only(bottom: 5.0),
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: TextFormField(
                                controller: _givenNames,
                                enabled: true,
                                decoration: const InputDecoration(
                                    labelText: 'Given names'),
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                validator: (val) => val!.isEmpty
                                    ? 'Please enter given names'
                                    : null,
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  margin: const EdgeInsets.only(right: 13.0),
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                        labelText: 'Class number'),
                                    items: AppData().classNumberList,
                                    value: _classNumber,
                                    validator: (val) =>
                                        val == null ? 'Class number ?' : null,
                                    onChanged: (val) => setState(() {
                                      _classNumber = val as String?;
                                    }),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  margin: const EdgeInsets.only(left: 13.0),
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                        labelText: 'Letter'),
                                    items: AppData().classLetterList,
                                    value: _classLetter,
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
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    margin: const EdgeInsets.only(right: 13.0),
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: TextFormField(
                                      controller: _pickedDate,
                                      enabled: true,
                                      readOnly: true,
                                      decoration: const InputDecoration(
                                          labelText: 'Date of birth'),
                                      onTap: () => _selectDate(context),
                                    )),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    margin: const EdgeInsets.only(left: 13.0),
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: TextFormField(
                                      controller: _age,
                                      enabled: false,
                                      decoration: const InputDecoration(
                                          labelText: 'Age'),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.90,
                            margin: const EdgeInsets.only(bottom: 5.0),
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: DropdownButtonFormField(
                              decoration:
                                  const InputDecoration(labelText: 'Sex'),
                              items: AppData().genderList,
                              value: _gender,
                              validator: (val) =>
                                  val == null ? ' Please enter sex?' : null,
                              onChanged: (val) => setState(() {
                                _gender = val as String?;
                              }),
                            ),
                          ),
                        ],
                      )),
                  Step(
                      isActive: _currentStep >= 1,
                      title: const Text('Averages'),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    margin: const EdgeInsets.only(right: 5.0),
                                    padding: const EdgeInsets.only(left: 1.0),
                                    child: TextFormField(
                                      controller: _firstTermOverallAverage,
                                      enabled: true,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          labelText: '1st'),
                                      onChanged: (value) => setState(() {
                                        showCalculatedAvg();
                                      }),
                                    )),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    margin: const EdgeInsets.only(left: 5.0),
                                    padding: const EdgeInsets.only(right: 3.0),
                                    child: TextFormField(
                                      controller: _secondTermOverallAverage,
                                      enabled: true,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          labelText: '2nd'),
                                      onChanged: (value) => setState(() {
                                        showCalculatedAvg();
                                      }),
                                    )),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    margin: const EdgeInsets.only(left: 5.0),
                                    padding: const EdgeInsets.only(right: 3.0),
                                    child: TextFormField(
                                      controller: _thirdTermOverallAverage,
                                      enabled: true,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          labelText: '3rd'),
                                      onChanged: (value) => setState(() {
                                        showCalculatedAvg();
                                      }),
                                    )),
/*                                 Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.17,
                                    margin: const EdgeInsets.only(left: 5.0),
                                    padding: const EdgeInsets.only(right: 1.0),
                                    child: TextFormField(
                                      controller: _avg,
                                      enabled: false,
                                      decoration: const InputDecoration(
                                          labelText: 'Avg.'),
                                    )), */
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.17,
                                  margin: const EdgeInsets.only(
                                      left: 5.0, top: 3.0),
                                  padding: const EdgeInsets.only(
                                      right: 1.0, top: 1.0),
                                  child: InputDecorator(
                                    decoration: const InputDecoration(
                                      labelText: 'Avg.',
                                      /*   border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ), */
                                    ),
                                    child: Text("${showCalculatedAvg()}"),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                  Step(
                      isActive: _currentStep >= 2,
                      title: const Text("Information from parent(s)"),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              margin: const EdgeInsets.only(bottom: 5.0),
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: TextFormField(
                                controller: _parentsOpinion,
                                enabled: true,
                                decoration: const InputDecoration(
                                    labelText: "Parent's opinion"),
                                keyboardType: TextInputType.text,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                /* validator: (val) => val!.isEmpty
                                    ? 'Please enter problem details'
                                    : null, */
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              margin: const EdgeInsets.only(bottom: 5.0),
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: TextFormField(
                                controller: _parentsPhoneNumber,
                                enabled: true,
                                decoration: const InputDecoration(
                                    labelText: "Parent's phone number"),
                                keyboardType: TextInputType.phone,

                                /* validator: (val) => val!.isEmpty
                                    ? 'Please enter problem details'
                                    : null, */
                              )),
                        ],
                      )),
                  Step(
                    isActive: _currentStep >= 3,
                    title: const Text('Decision'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.90,
                            margin: const EdgeInsets.only(bottom: 5.0),
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: TextFormField(
                              controller: _problemDetails,
                              enabled: true,
                              decoration: const InputDecoration(
                                  labelText: 'Orientation test results'),
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.sentences,

                              /* validator: (val) => val!.isEmpty
                                    ? 'Please enter problem details'
                                    : null, */
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.90,
                            margin: const EdgeInsets.only(bottom: 5.0),
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: TextFormField(
                              controller: _problemDetails,
                              enabled: true,
                              decoration: const InputDecoration(
                                  labelText: "Counselor's opinion"),
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.sentences,
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.90,
                            margin: const EdgeInsets.only(bottom: 5.0),
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: TextFormField(
                              controller: _problemDetails,
                              enabled: true,
                              decoration: const InputDecoration(
                                  labelText: 'Class counsel decision'),
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.sentences,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 5.0, bottom: 10.0),
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('CANCEL',
                          style: TextStyle(
                              letterSpacing: 1.0, color: textBlackColor)),
                      /* style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ), */
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 5.0, bottom: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        /*  log('Tapped save button!'); */
                        SnackBarMessage().underConstruction(context);
                      },
                      child: const Text(
                        'SAVE',
                        style: TextStyle(
                            letterSpacing: 1.0, fontWeight: FontWeight.bold),
                      ),
                      /*  style: ElevatedButton.styleFrom(backgroundColor: myTeal), */
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }

  showCalculatedAvg() {
    double avg = CalculatorService().calculateMean([
      double.tryParse(_firstTermOverallAverage.text) ?? 0,
      double.tryParse(_secondTermOverallAverage.text) ?? 0,
      double.tryParse(_thirdTermOverallAverage.text) ?? 0
    ]);
    return avg.toStringAsFixed(2);
  }
}
