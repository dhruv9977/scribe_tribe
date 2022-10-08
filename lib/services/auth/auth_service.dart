import 'package:flutter/material.dart';

import 'auth_provider.dart';
import 'auth_user.dart';
import 'firebase_auth_provider.dart';

class AuthService implements AuthProvider {
  const AuthService(this.provider);
  final AuthProvider provider;

  factory AuthService.firebase() => AuthService(FirebaseAuthProvider());

  @override
  Future<void> initialize() => provider.initialize();


  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<void> verifyPhoneNumber(
          {required BuildContext context,
          required TextEditingController phoneController}) =>
      provider.verifyPhoneNumber(
        phoneController: phoneController,
        context: context,
      );

  @override
  Future<void> signInWithPhoneNumber(
          {required String otpController,
          required String verId,
          required BuildContext context}) =>
      provider.signInWithPhoneNumber(
          otpController: otpController, context: context, verId: verId);
}
