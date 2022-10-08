import 'package:flutter/material.dart';

import 'auth_user.dart';

abstract class AuthProvider {
  Future<void> initialize();

  AuthUser? get currentUser;



  Future<void> logOut();

  Future<void> verifyPhoneNumber(
      {required BuildContext context,
      required TextEditingController phoneController});

  Future<void> signInWithPhoneNumber(
      {required String otpController,
      required String verId,
      required BuildContext context});
}
