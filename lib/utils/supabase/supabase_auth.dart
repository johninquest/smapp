import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:developer';

class AuthService {
  static const String projUrl = 'https://cyifcmqsbowqfnwycvjk.supabase.co';
  static const String projAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN5aWZjbXFzYm93cWZud3ljdmprIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjgwOTI2NDUsImV4cCI6MTk4MzY2ODY0NX0.nuI2Y6NO_QusYOJwW3u-h97wpxu5xcznsg7CGbYuq00';

  final SupabaseClient sbClient = Supabase.instance.client;

  // final authClient = SupabaseClient(projUrl, projAnonKey);

/*   Future<void> signUpUser(String userEmail, String userPassword) async {
    log('Submitted Id, Password => $userEmail, $userPassword');
    final response =
        await authClient.auth.signUp(email: userEmail, password: userPassword);
    if (response.error != null) {
      log('An error occured!');
    } else {
      final User? user = response.user;
      final Session? session = response.data;
      log('User => $user');
      log('Session data => $session');
    }
  } */

  Future<void> signInUserViaOtp(String userEmail) async {
    log('User email => $userEmail');
    await sbClient.auth.signInWithOtp(email: userEmail);
/*     try {
      await sbClient.auth.signInWithOtp(email: userEmail);
    } on AuthException catch (e) {
      log('Error occured => $e');
    } catch (e) {
      log('Some other error => $e');
    } */
  }

  Future<void> verifyUserOtp(String userEmail, String otp) async {
    log('User email => $userEmail');
    await sbClient.auth
        .verifyOTP(email: userEmail, token: otp, type: OtpType.magiclink);
  }

  Future<void> signInUserViaEmailAndPassword(
      String userEmail, String userPassword) async {
    log('User email => $userEmail');
    final response = await sbClient.auth
        .signInWithPassword(email: userEmail, password: userPassword);
    final Session? session = response.session;
    final User? user = response.user;
    log('Session => $session');
    log('User => $user');
  }

/*   StreamSubscription<AuthState> listenToAuthStatus() {
    return sbClient.auth.onAuthStateChange.listen((e) {
      final Session? session = e.session;
      final AuthChangeEvent event = e.event;

      switch (e) {
        case AuthChangeEvent.signedIn:
          if (session != null) {
            // Do some
          }
          break;
        case AuthChangeEvent.signedOut:
          if (session != null) {
            // Do some
          }
          break;
      }
    });
  } */

  bool isLoggedIn() {
    return sbClient.auth.currentSession != null;
  }

  Future<void> signUserOut() async {
    await sbClient.auth.signOut();
  }

  /*
    Future<void> signInUser(String userId, String userPassword) async {
    log('Submitted Id, Password => $userId, $userPassword');
    /* final AuthResponse res = await authClient.auth
        .signInWithPassword(email: userId, password: userPassword); */
    try {
      AuthResponse res = await sbClient.auth
          .signInWithPassword(email: userId, password: userPassword);
    } on AuthException catch (e) {
      log('Error occured => $e');
    } catch (e) {
      log('Some other error => $e');
    }
  }
  */

  Future<dynamic> authViaOtp(String username) async {
    log('Submitted Id, Password => $username');
    /* final AuthResponse res = await authClient.auth
        .signInWithPassword(email: userId, password: userPassword); */
    await sbClient.auth.signInWithOtp(email: username);
    /*  try {
      final AuthResponse res = await authClient.auth.signInWithOtp(email: username);
    } on AuthException catch (e) {
      log('Error occured => $e');
    } catch (e) {
      log('Some other error => $e');
    } */
  }
}
