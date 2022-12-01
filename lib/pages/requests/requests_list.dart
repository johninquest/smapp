import 'package:flutter/material.dart';
import 'package:smapp/services/web.dart';
import '../../styles/colors.dart';
import '../bottom_nav_bar.dart';

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
            List<dynamic> data = snapshot.data as List;
            // log(_data.toString());
            // print(data.length);
            // print(data[0]);
            return Center(
              child: Text('Has data! \n $data'),
            );
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
