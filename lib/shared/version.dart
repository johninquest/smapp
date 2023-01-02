import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
// import 'dart:developer';

class VersionInfo extends StatelessWidget {
  const VersionInfo({super.key});

  Future<PackageInfo> getPackageInfo() async {
    return await PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
        future: getPackageInfo(),
        builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
          if (snapshot.hasError) {
            return const Text('An error occured!');
          } else if (snapshot.hasData) {
            final vData = snapshot.data!;
            // log('App version => ${vData.version}');
            return Center(
              child: Text('v${vData.version}'),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
