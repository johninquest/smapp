import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../shared/dialogs.dart';

class WebService {
  Future<void> openUrl(String targetUrl, context) async {
    final Uri url = Uri.parse(targetUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      showDialog(
          context: context,
          builder: (_) => ErrorDialog('Could not launch $targetUrl'));
    }
  }
}
