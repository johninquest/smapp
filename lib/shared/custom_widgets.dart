import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../utils/router.dart';
import '../styles/colors.dart';

class EmptyTable extends StatelessWidget {
  const EmptyTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20.0, top: 50.0),
          child: const Text(
            'No requests submitted!',
            // style: BodyStyle,
          ),
        ),
        ElevatedButton(
            onPressed: () =>
                PageRouter().navigateToPage(const HomePage(), context),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              padding: const EdgeInsets.all(10.0),
            ),
            child: Column(
              children: const [
                Icon(
                  Icons.add,
                  size: 25.0,
                ),
              ],
            )),
      ],
    );
  }
}
