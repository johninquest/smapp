import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../shared/custom_widgets.dart';
import '../../styles/colors.dart';
import '../../styles/style.dart';
import '../../utils/date_time_helper.dart';
import '../../utils/router.dart';
import '../../utils/web.dart';
import '../bottom_nav_bar.dart';
import 'add_case.dart';
import 'case_details.dart';

class CaseListPage extends StatelessWidget {
  const CaseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reqData = SupabaseService().fetchData('cases');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Case list'.toUpperCase(),
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: reqData,
        builder: ((context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error occured!'),
            );
          }
          if (snapshot.hasData) {
            List<dynamic> sbData = snapshot.data as List;
            return CaseListData(casesData: sbData);
            /*   return Center(
              child: Text('$sbData'),
            ); */
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
      bottomNavigationBar: const BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: const Tooltip(
          message: 'Add new case',
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        onPressed: () =>
            PageRouter().navigateToPage(const AddCasePage(), context),
      ),
    );
  }
}

class CaseListData extends StatefulWidget {
  final List? casesData;
  const CaseListData({super.key, required this.casesData});

  @override
  State<CaseListData> createState() => _CaseListDataState();
}

class _CaseListDataState extends State<CaseListData> {
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  Widget build(BuildContext context) {
    List caseRecords = widget.casesData as List;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: buildTable(caseRecords),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTable(List tData) {
    if (tData.isEmpty) {
      return Container(
        margin: const EdgeInsets.only(top: 50.0),
        child: const Center(
          child: EmptyTable(),
        ),
      );
    } else {
      final allColumns = [
        'Date',
        'Name',
        'Problem',
        'Class',
      ];
      return DataTable(
        sortAscending: isAscending,
        sortColumnIndex: sortColumnIndex,
        columnSpacing: 20.0,
        horizontalMargin: 0.0,
        showCheckboxColumn: false,
        columns: getColumns(allColumns),
        rows: getRows(tData),
      );
    }
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(
              column,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List rows) => rows
      .map(
        (e) => DataRow(
          color: MaterialStateProperty.all(Colors.transparent),
          selected: false,
          onSelectChanged: (val) {
            if (val == true) {
              return PageRouter()
                  .navigateToPage(CaseDetailsPage(rowData: e), context);
            }
          },
          cells: [
            DataCell(Text(
                DateTimeHelper().isoToCmrDateOnly(e['created_at']) ?? '',
                style: TableItemStyle,
                textAlign: TextAlign.left)),
            DataCell(Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  toBeginningOfSentenceCase(e['student_data']['surname']) ?? '',
                  style: TableItemStyle,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  toBeginningOfSentenceCase(e['student_data']['given_names']) ??
                      '',
                  style: TableItemStyle,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )),
            DataCell(ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.20,
              ),
              child: Text(
                toBeginningOfSentenceCase(e['problem']['problem_category']) ??
                    '',
                style: TableItemStyle,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
            )),
            DataCell(Row(
              children: [
                Text(e['student_data']['class_number'] ?? '',
                    textAlign: TextAlign.right),
                const SizedBox(
                  width: 3.0,
                ),
                Text((e['student_data']['class_letter']).toUpperCase() ?? '',
                    textAlign: TextAlign.right),
              ],
            )),
          ],
        ),
      )
      .toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      widget.casesData!.sort((item1, item2) =>
          compareString(ascending, item1['created_at'], item2['created_at']));
    } else if (columnIndex == 1) {
      widget.casesData!.sort((item1, item2) =>
          compareString(ascending, item1['surname'], item2['surname']));
    } else if (columnIndex == 2) {
      widget.casesData!.sort((item1, item2) => compareString(
          ascending, item1['request_category'], item2['request_category']));
    } else if (columnIndex == 3) {
      widget.casesData!.sort((item1, item2) => compareString(
          ascending, item1['class_number'], item2['class_number']));
    }

    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
