import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../shared/dialogs.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCred {
  final String projUrl = 'https://cyifcmqsbowqfnwycvjk.supabase.co';
  final String projAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN5aWZjbXFzYm93cWZud3ljdmprIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjgwOTI2NDUsImV4cCI6MTk4MzY2ODY0NX0.nuI2Y6NO_QusYOJwW3u-h97wpxu5xcznsg7CGbYuq00';
}

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

class SupabaseService {
  final _supabase =
      SupabaseClient(SupabaseCred().projUrl, SupabaseCred().projAnonKey);

  fetchData() async {
    final res = await _supabase.from('requests').select('*');
    return res;
  }
}
