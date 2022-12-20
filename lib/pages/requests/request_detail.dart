import 'package:flutter/material.dart';
import 'package:smapp/pages/bottom_nav_bar.dart';
import 'package:smapp/services/date_time_helper.dart';
import 'package:smapp/styles/colors.dart';

class RequestDetailsPage extends StatelessWidget {
  final dynamic rowData;
  const RequestDetailsPage({super.key, required this.rowData});

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateTimeHelper();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request details'),
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
            /*  MyTableRow(
              rowName: 'Date',
              rowData: rowData['created_at'] ?? '',
            ), */
            MyTableRow(
              rowName: 'Category',
              rowData: rowData['request_category'] ?? '',
            ),
            MyTableRow(
              rowName: 'Is urgent?',
              rowData: rowData['is_urgent'] ?? '',
            ),
            const MyTableRow(
              rowName: 'Additional details',
              /* rowData: rowData['request_details'] ?? '', */
              rowData: 'Under construction!',
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
              rowName: 'Submitted by',
              rowData:
                  '${rowData['given_names'] ?? ''} ${rowData['surname'] ?? ''}',
            ),
            MyTableRow(
              rowName: 'Date',
              rowData:
                  dateFormatter.isoToCmrDateFormat(rowData['created_at']) ?? '',
            ),
            /* Text('$rowData') */
          ],
        ),
      )),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

/* class RequestDetailsData extends StatefulWidget {
  const RequestDetailsData({super.key});

  @override
  State<RequestDetailsData> createState() => _RequestDetailsDataState();
}

class _RequestDetailsDataState extends State<RequestDetailsData> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
} */

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
