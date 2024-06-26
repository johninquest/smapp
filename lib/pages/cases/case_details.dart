import 'package:flutter/material.dart';
import '../../shared/snackbar_messages.dart';
import '../../styles/colors.dart';
import '../../styles/style.dart';
import '../../utils/date_time_helper.dart';
import '../../utils/router.dart';
import '../../utils/web.dart';
import 'case_list.dart';
import 'update_case.dart';

class CaseDetailsPage extends StatefulWidget {
  final Map rowData;
  const CaseDetailsPage({super.key, required this.rowData});

  @override
  State<CaseDetailsPage> createState() => _CaseDetailsPageState();
}

class _CaseDetailsPageState extends State<CaseDetailsPage> {
  late int rowId;

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateTimeHelper();
    rowId = widget.rowData['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Case details'.toUpperCase(),
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        margin: const EdgeInsets.only(left: 3.0, right: 3.0),
        padding: const EdgeInsets.only(left: 3.0, right: 3.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 13.0, bottom: 8.0),
                padding: const EdgeInsets.all(3.0),
                child: const Text(
                  'STUDENT',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 1.0),
                ),
              ),
              MyTableRow(
                rowName: 'Registration number',
                rowData:
                    widget.rowData['student_data']['registration_number'] ?? '',
              ),
              MyTableRow(
                rowName: 'Student name(s)',
                rowData:
                    '${widget.rowData['student_data']['given_names'] ?? ''} ${widget.rowData['student_data']['surname'] ?? ''}',
              ),
              MyTableRow(
                rowName: 'Class',
                rowData:
                    '${widget.rowData['student_data']['class_number'] ?? ''} ${widget.rowData['student_data']['class_letter'] ?? ''}',
              ),
              MyTableRow(
                rowName: 'Date of birth',
                rowData: dateFormatter.isoToCmrDateOnly(
                    widget.rowData['student_data']['date_of_birth']),
              ),
              MyTableRow(
                rowName: 'Age',
                rowData: dateFormatter.ageFromDateStr(
                    widget.rowData['student_data']['date_of_birth']),
                /* rowData: '', */
              ),
              MyTableRow(
                rowName: 'Status',
                rowData: widget.rowData['student_data']['status'] ?? '',
              ),
              Container(
                margin: const EdgeInsets.only(top: 13.0, bottom: 8.0),
                padding: const EdgeInsets.all(3.0),
                child: const Text(
                  'PARENT',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 1.0),
                ),
              ),
              const MyTableRow(
                rowName: 'Parent name(s)',
                rowData: 'coming soon',
              ),
              Container(
                margin: const EdgeInsets.only(top: 13.0, bottom: 8.0),
                padding: const EdgeInsets.all(3.0),
                child: const Text(
                  'PROBLEM',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 1.0),
                ),
              ),
              MyTableRow(
                rowName: 'Problem category',
                rowData: widget.rowData['problem']['problem_category'],
              ),
              MyTableRowDetails(
                rowName: 'Additional details',
                rowData: widget.rowData['problem']['problem_details'],
              ),
              MyTableRowDetails(
                rowName: 'Method',
                rowData: widget.rowData['method'],
              ),
              MyTableRowDetails(
                rowName: 'Solution',
                rowData: widget.rowData['solution'],
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
                        onPressed: (() {
                          PageRouter().navigateToPage(
                              UpdateCasePage(caseData: widget.rowData),
                              context);
                        }),
                        child: const Text(
                          'EDIT',
                          style: TextStyle(letterSpacing: 1.0),
                        )),
                    OutlinedButton(
                        onPressed: () => showDialog(
                            context: context, builder: (_) => _deleteDialog()),
                        child: const Text(
                          'DELETE',
                          style:
                              TextStyle(color: warnColor, letterSpacing: 1.0),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _deleteDialog() {
    return AlertDialog(
      title: const Icon(
        Icons.warning_amber_outlined,
        size: 55.0,
        color: primaryColor,
      ),
      content: const Text(
        'Delete?',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 21.0, letterSpacing: 1.0),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'NO',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textBlackColor,
                    letterSpacing: 1.0),
              ),
            ),
            TextButton(
                onPressed: () {
                  /*  log('Row id => $rowId'); */
                  SupabaseService()
                      .deleteRow('cases', 'id', rowId)
                      .then((value) {
                    if (value == 'delete-success') {
                      SnackBarMessage().customSuccessMessage(
                          'Case deleted successfully', context);
                      PageRouter()
                          .navigateToPage(const CaseListPage(), context);
                    }
                    if (value == 'delete-failed') {
                      SnackBarMessage()
                          .customErrorMessage('Case delete failed', context);
                    }
                  });
                },
                child: const Text(
                  'YES',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 1.0),
                ))
          ],
        ),
      ],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
            padding: const EdgeInsets.only(
                bottom: 5.0, top: 3.0, left: 5.0, right: 1.0),
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
