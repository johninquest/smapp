import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../styles/style.dart';
import '../../utils/router.dart';
import '../../utils/web.dart';
import '../bottom_nav_bar.dart';
import 'add_evaluation.dart';
import 'evaluation_calculator.dart';

class EvaluationsListPage extends StatelessWidget {
  const EvaluationsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reqData = SupabaseService().fetchData('evaluations');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Evaluations list'.toUpperCase(),
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
            int? rowCount = sbData.length;
            // log('Table size => $rowCount');
            /* return CaseListData(casesData: sbData); */
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(13.0),
                    child: const Text(
                      'Under construction',
                      style: TextStyle(color: warnColor),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(13.0),
                    child: Text(
                      '$rowCount',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 21.0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(13.0),
                    child: OutlinedButton(
                      onPressed: (() => PageRouter().navigateToPage(
                          const EvaluationCalculator(), context)),
                      child: Text(
                        'average calculator'.toUpperCase(),
                        style: const TextStyle(color: primaryColor),
                      ),
                    ),
                  )
                ],
              ),
            );
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
            PageRouter().navigateToPage(const AddEvaluationPage(), context),
      ),
    );
  }
}
