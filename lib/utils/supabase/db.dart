import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDb {
  static const String projUrl = 'https://cyifcmqsbowqfnwycvjk.supabase.co';
  static const String projAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN5aWZjbXFzYm93cWZud3ljdmprIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjgwOTI2NDUsImV4cCI6MTk4MzY2ODY0NX0.nuI2Y6NO_QusYOJwW3u-h97wpxu5xcznsg7CGbYuq00';

  final authClient = SupabaseClient(projUrl, projAnonKey);

  Future<dynamic> addRow() async {}
  Future<dynamic> updateRow() async {}
  Future<dynamic> deleteRow() async {}
}
