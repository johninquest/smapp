import 'package:flutter/material.dart';
/* import 'package:provider/provider.dart';
import '../../providers/request_provider.dart'; */
import '../../styles/colors.dart';
import '../../styles/style.dart';
import '../../utils/date_time_helper.dart';
import '../../utils/router.dart';
import '../bottom_nav_bar.dart';
import '../cases/add_case.dart';

class RequestDetailsPage extends StatelessWidget {
  final dynamic rowData;
  const RequestDetailsPage({super.key, required this.rowData});

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateTimeHelper();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Request details'.toUpperCase(),
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        margin: const EdgeInsets.only(left: 3.0, right: 3.0),
        padding: const EdgeInsets.only(left: 3.0, right: 3.0),
        // child: Text('$rowData')
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTableRow(
              rowName: 'Date',
              rowData:
                  dateFormatter.isoToCmrDateOnly(rowData['created_at']) ?? '',
            ),
            MyTableRow(
              rowName: 'Request category',
              rowData: rowData['request_category'] ?? '',
            ),
            MyTableRow(
              rowName: 'Is urgent?',
              rowData: rowData['is_urgent'] ?? '',
            ),
            MyTableRowDetails(
              rowName: 'Additional details',
              rowData: rowData['request_details'] ?? '',
              /*  rowData: 'Under construction!', */
            ),
            const SizedBox(
              height: 13.0,
            ),
            MyTableRow(
              rowName: 'Student name(s)',
              rowData:
                  '${rowData['given_names'] ?? ''} ${rowData['surname'] ?? ''}',
            ),
            MyTableRow(
              rowName: 'Registration number',
              rowData: rowData['registration_number'] ?? '',
            ),
            MyTableRow(
              rowName: 'Class',
              rowData:
                  '${rowData['class_number'] ?? ''} ${rowData['class_letter'] ?? ''}',
            ),
            MyTableRow(
              rowName: 'Sex',
              rowData: rowData['gender'] ?? '',
            ),
            Container(
              margin: const EdgeInsets.only(top: 13.0),
              child: Tooltip(
                message: 'Use this information to create a new case',
                child: OutlinedButton(
                  child: const Text('NEW CASE'),
                  onPressed: () {
                    /* log('Create new case with => $rowData');
                    context.read<RequestProvider>().setItem(rowData); */
                    PageRouter().navigateToPageWithData(
                        const AddCasePage(), context, rowData);
                  },
                ),
              ),
            )
          ],
        ),
      )),
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
              rowData!,
            ),
          )
        ],
      ),
    );
  }
}
