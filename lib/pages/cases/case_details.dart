import 'package:flutter/material.dart';
import 'package:smapp/pages/requests/request_detail.dart';
import 'package:smapp/shared/snackbar_messages.dart';
import '../../styles/colors.dart';
import '../../utils/date_time_helper.dart';
import 'dart:developer';

class CaseDetailsPage extends StatelessWidget {
  final Map rowData;
  const CaseDetailsPage({super.key, required this.rowData});

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateTimeHelper();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Case details',
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        margin: const EdgeInsets.only(left: 3.0, right: 3.0),
        padding: const EdgeInsets.only(left: 3.0, right: 3.0),
        // child: Text('$rowData')
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*  MyTableRow(
            rowName: 'Date',
            rowData:
                dateFormatter.isoToCmrDateFormat(rowData['created_at']) ?? '',
          ), */
              SizedBox(
                height: 34.0,
                child: Text(
                  'student'.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              MyTableRow(
                rowName: 'Registration number',
                rowData: rowData['student_data']['registration_number'] ?? '',
              ),
              MyTableRow(
                rowName: 'Student name(s)',
                rowData:
                    '${rowData['student_data']['given_names'] ?? ''} ${rowData['student_data']['surname'] ?? ''}',
              ),
              MyTableRow(
                rowName: 'Class',
                rowData:
                    '${rowData['student_data']['class_number'] ?? ''} ${rowData['student_data']['class_letter'] ?? ''}',
              ),
              /*   MyTableRow(
            rowName: 'Request category',
            rowData: rowData['request_category'] ?? '',
          ), */
              MyTableRow(
                rowName: 'Date of birth',
                rowData: dateFormatter.isoToCmrDateFormat2(
                    rowData['student_data']['date_of_birth']),
              ),
              MyTableRow(
                rowName: 'Age',
                rowData: dateFormatter
                    .ageFromDateStr(rowData['student_data']['date_of_birth']),
                /* rowData: '', */
              ),
              MyTableRow(
                rowName: 'Status',
                rowData: rowData['student_data']['status'] ?? '',
              ),
              SizedBox(
                height: 34.0,
                child: Text(
                  'parent'.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const MyTableRow(
                rowName: 'Parent name(s)',
                rowData: 'coming soon',
              ),
              /* MyTableRowDetails(
                rowName: 'Additional details',
                rowData: rowData['request_details'] ?? '',
              ), */
              SizedBox(
                height: 34.0,
                child: Text(
                  'problem'.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              MyTableRow(
                rowName: 'Problem',
                rowData: rowData['problem']['problem_category'],
              ),
              MyTableRowDetails(
                rowName: 'Additional details',
                rowData: rowData['problem']['problem_details'],
              ),
              MyTableRowDetails(
                rowName: 'Method',
                rowData: rowData['method'],
              ),
              MyTableRowDetails(
                rowName: 'Solution',
                rowData: rowData['solution'],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 13.0, top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedButton(
                        onPressed: (() => Navigator.pop(context)),
                        child: const Text(
                          'BACK',
                          style: TextStyle(
                              color: textBlackColor, letterSpacing: 1.0),
                        )),
                    ElevatedButton(
                        onPressed: (() => SnackBarMessage().customErrorMessage(
                            'Tapped update button!', context)),
                        child: const Text(
                          'EDIT',
                          style: TextStyle(letterSpacing: 1.0),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      /* bottomNavigationBar: const BottomNavBar(), */
    );
  }
}

class MyTableRow extends StatelessWidget {
  final String? rowName;
  final String? rowData;
  const MyTableRow({Key? key, this.rowName, this.rowData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: primaryColor, width: 1.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 1.0, left: 5.0),
            padding: const EdgeInsets.only(bottom: 1.0, left: 5.0),
            child: Text(
              rowName!,
              style: const TextStyle(
                  color: primaryColor, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 1.0, right: 5.0),
            padding: const EdgeInsets.only(bottom: 1.0, right: 5.0),
            child: Text(rowData!.toUpperCase(),
                style: const TextStyle(/* fontWeight: FontWeight.bold */)),
          )
        ],
      ),
    );
  }
}

class MyTableRowDetails extends StatelessWidget {
  final String? rowName;
  final String? rowData;
  const MyTableRowDetails({Key? key, this.rowName, this.rowData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: primaryColor, width: 1.0))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 1.0, left: 5.0),
                padding: const EdgeInsets.only(bottom: 1.0, left: 5.0),
                child: Text(
                  rowName!,
                  style: const TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 1.0, right: 5.0),
                  padding: const EdgeInsets.only(bottom: 1.0, right: 5.0),
                  child: const Text('')),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 1.0, left: 5.0, right: 1.0),
            padding: const EdgeInsets.only(bottom: 1.0, left: 5.0, right: 1.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              rowData ?? '',
            ),
          )
        ],
      ),
    );
  }
}
