import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/date_time_helper.dart';
import '../../utils/router.dart';
import '../../utils/web.dart';
import '../../shared/custom_widgets.dart';
import '../../styles/style.dart';
import 'request_detail.dart';

class RequestsListPage extends StatelessWidget {
  const RequestsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reqData = SupabaseService().fetchData('requests');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Requests list'.toUpperCase(),
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
            return RequestsListData(tableData: sbData);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
      /*  bottomNavigationBar: const BottomNavBar(), */
    );
  }
}

class RequestsListData extends StatefulWidget {
  final List? tableData;
  const RequestsListData({Key? key, required this.tableData}) : super(key: key);

  @override
  State<RequestsListData> createState() => _RequestsListDataState();
}

class _RequestsListDataState extends State<RequestsListData> {
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  Widget build(BuildContext context) {
    List crRecords = widget.tableData as List;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: buildTable(crRecords),
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
                  .navigateToPage(RequestDetailsPage(rowData: e), context);
            }
          },
          cells: [
            DataCell(Text(
                DateTimeHelper().isoToCmrDateFormat(e['created_at']) ?? '',
                style: TableItemStyle,
                textAlign: TextAlign.left)),
            DataCell(Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e['surname'] ?? '',
                  style: TableItemStyle,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
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
                Text(e['class_number'] ?? '', textAlign: TextAlign.right),
                const SizedBox(
                  width: 3.0,
                ),
                Text((e['class_letter']).toUpperCase() ?? '',
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
