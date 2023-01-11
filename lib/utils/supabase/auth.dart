import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:developer';

class SupabaseAuth {
  static const String projUrl = 'https://cyifcmqsbowqfnwycvjk.supabase.co';
  static const String projAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN5aWZjbXFzYm93cWZud3ljdmprIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjgwOTI2NDUsImV4cCI6MTk4MzY2ODY0NX0.nuI2Y6NO_QusYOJwW3u-h97wpxu5xcznsg7CGbYuq00';

  final authClient = SupabaseClient(projUrl, projAnonKey);

  Future<dynamic> authenticateUser(String userId, String userPassword) async {
    log('Submitted Id, Password => $userId, $userPassword');
    /* final AuthResponse res = await authClient.auth
        .signInWithPassword(email: userId, password: userPassword); */
    try {
      final AuthResponse res = await authClient.auth
          .signInWithPassword(email: userId, password: userPassword);
    } on AuthException catch (e) {
      log('Error occured => $e');
    } catch (e) {
      log('Some other error => $e');
    }
  }

  Future<dynamic> authViaOtp(String username) async {
    log('Submitted Id, Password => $username');
    /* final AuthResponse res = await authClient.auth
        .signInWithPassword(email: userId, password: userPassword); */
    await authClient.auth.signInWithOtp(email: username);
    /*  try {
      final AuthResponse res = await authClient.auth.signInWithOtp(email: username);
    } on AuthException catch (e) {
      log('Error occured => $e');
    } catch (e) {
      log('Some other error => $e');
    } */
  }
}
