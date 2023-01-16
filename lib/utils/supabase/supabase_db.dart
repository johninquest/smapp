import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  static const String projUrl = 'https://cyifcmqsbowqfnwycvjk.supabase.co';
  static const String projAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN5aWZjbXFzYm93cWZud3ljdmprIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjgwOTI2NDUsImV4cCI6MTk4MzY2ODY0NX0.nuI2Y6NO_QusYOJwW3u-h97wpxu5xcznsg7CGbYuq00';

  final authClient = SupabaseClient(projUrl, projAnonKey);
/*   final SupabaseClient sbClient = Supabase.instance.client; */

  Future<dynamic> getAllRows(String tableName) async {
    try {
      final response = await authClient
          .from(tableName)
          .select('*')
          .order('created_at', ascending: false);
      if (response.error == null) {
        return response.data;
      }
    } catch (e) {
      throw Exception('Failed to fetch data!');
    }
  }

  Future<bool?> addRow(String tableName, Map<String, dynamic> rowData) async {
    try {
      final response = await authClient.from(tableName).insert(rowData);
      if (response.error == null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Failed to insert row!');
    }
  }

  Future<dynamic> updateRow() async {}
  Future<dynamic> deleteRow() async {}
}
