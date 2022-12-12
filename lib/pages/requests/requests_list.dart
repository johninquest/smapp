import 'package:flutter/material.dart';
import 'package:smapp/services/date_time_helper.dart';
import '../../services/web.dart';
import '../../shared/wigs.dart';
import '../../styles/style.dart';
import '../bottom_nav_bar.dart';
import 'package:intl/intl.dart';

class RequestsForCounselingPage extends StatelessWidget {
  const RequestsForCounselingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reqData = SupabaseService().fetchData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requests for counseling'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: reqData,
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error occured'),
            );
          }
          if (snapshot.hasData) {
            List<dynamic> sbData = snapshot.data as List;
            // log(_data.toString());
            // print(data.length);
            // print(data[0]);
            /*  return Center(
              child: Text('Has data! \n $data'),
            ); */
            return TableOfContactRequests(tableData: sbData);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class TableOfContactRequests extends StatefulWidget {
  final List? tableData;
  const TableOfContactRequests({Key? key, required this.tableData})
      : super(key: key);

  @override
  State<TableOfContactRequests> createState() => _TableOfContactRequestsState();
}

class _TableOfContactRequestsState extends State<TableOfContactRequests> {
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  Widget build(BuildContext context) {
    List daybookRecords = widget.tableData as List;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: buildTable(daybookRecords),
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
        'Category',
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
              // style: ListTitleStyle,
            ),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List rows) => rows
      .map(
        (e) => DataRow(
          color: MaterialStateProperty.all(Colors.transparent),
          selected: false,
/*           onSelectChanged: (val) {
            if (val == true) {
              return PageRouter()
                  .navigateToPage(ItemDetailPage(rowData: e), context);
            }
          }, */
          cells: [
            DataCell(
                Text(DateTimeHelper().isoToCmrDateFormat(e['created_at']) ?? '',
                    // e['created_at'] ?? '',
                    style: TableItemStyle,
                    textAlign: TextAlign.left)),
            DataCell(Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  // Formatter().dbToUiValue(e['cost_area']) ?? '',
                  e['surname'] ?? '',
                  style: TableItemStyle,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  // Formatter().dbToUiValue(e['cost_area']) ?? '',
                  e['given_names'] ?? '',
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
                toBeginningOfSentenceCase(e['request_category']) ?? '',
                style: TableItemStyle,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
            )),
            DataCell(Row(
              children: [
                Text(e['class_number'] ?? '',
                    // style: StyleHandler().paymentStatus(e['payment_status']),
                    textAlign: TextAlign.right),
                Text((e['class_letter']).toUpperCase() ?? '',
                    // style: StyleHandler().paymentStatus(e['payment_status']),
                    textAlign: TextAlign.right),
              ],
            )),
          ],
        ),
      )
      .toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      widget.tableData!.sort((item1, item2) =>
          compareString(ascending, item1['created_at'], item2['created_at']));
    } else if (columnIndex == 1) {
      widget.tableData!.sort((item1, item2) =>
          compareString(ascending, item1['surname'], item2['surname']));
    } else if (columnIndex == 2) {
      widget.tableData!.sort((item1, item2) => compareString(
          ascending, item1['request_category'], item2['request_category']));
    } else if (columnIndex == 3) {
      widget.tableData!.sort((item1, item2) => compareString(
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
