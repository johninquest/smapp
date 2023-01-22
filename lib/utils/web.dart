import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../shared/dialogs.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:developer';

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

  Future<List<dynamic>> fetchData(String tableName) async {
    final res = await _supabase.from(tableName).select('*').order('created_at');
    return res as List;
  }

  Future<dynamic> tableSize(String tableName) async {
    final res =
        await _supabase.rpc('tableSize', params: {'table_name': tableName});
    log('Table sitze => $res');
    return res;
  }

  Future<dynamic> addRow(String tableName, Map<String, dynamic> rowData) async {
    try {
      final response = await _supabase.from(tableName).insert(rowData);
      /*  log('Response at service => ${response.runtimeType}');
      return response; */
      if (response == null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Insert exception => $e');
    }
  }

  Future<dynamic> deleteRow(String tableName, String colName, int rowId) async {
    try {
      final List<dynamic> deleteResponse =
          await _supabase.from(tableName).delete().eq(colName, rowId);
      if (deleteResponse.isNotEmpty) {
        return 'delete-success';
      }
      if (deleteResponse.isEmpty) {
        return 'deleted-failed';
      }
    } catch (e) {
      log('Delete exception => $e');
    }
  }

  Future<dynamic> updateRow(
      String tableName, int rowId, Map<String, dynamic> rowData) async {
    try {
      final updateResponse =
          await _supabase.from(tableName).update(rowData).eq('id', rowId);
      if (updateResponse == null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Update exception => $e');
    }
  }
}
