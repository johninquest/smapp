import 'package:flutter/material.dart';
import '../utils/date_time_helper.dart';
import '../utils/web.dart';
import '../styles/colors.dart';
import '../styles/style.dart';
import 'bottom_nav_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentYear = DateTimeHelper().currentYear(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Info',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.width * 0.95,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: const Text(
                  'Counseye',
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
              ),
              const Divider(
                indent: 110.0,
                endIndent: 110.0,
                thickness: 1.0,
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 75.0, top: 10.0),
                child: const Text(
                  'The management app for school counselors',
                  textAlign: TextAlign.center,
                  style: TextStyle(letterSpacing: 0.5),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 13.0),
                // ignore: sort_child_properties_last
                child: GestureDetector(
                  onTap: () =>
                      WebService().openUrl('https://johnapps.de', context),
                  child: Text(
                    '\u00A9 JOHN APPS $currentYear',
                    style: const TextStyle(
                      wordSpacing: 1.0,
                      fontSize: 11.0,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: primaryColor)),
                ),
              )
              /* const SizedBox(
                height: 25.0,
              ), */
              // AppVersionInfo()
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
