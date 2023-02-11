// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribetribe/controllers/login_controller.dart';
import 'package:scribetribe/screens/auth/login_screen/login_screen.dart';

import '../../components/constants/route_helper.dart';
import '../../components/widgets/progress_dialog.dart';
import '../../components/widgets/show_error_dialog.dart';
import '../../firebase_options.dart';
import 'auth_provider.dart';
import 'auth_user.dart';

class FirebaseAuthProvider implements AuthProvider {
  int? forceResendingToken;

  // Auth Initialization

  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

// Auth Current User
  @override
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return AuthUser.fromFirebase(user);
    } else {
      return null;
    }
  }

  // Auth signOut

  @override
  Future<void> logOut() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseAuth.instance.signOut();
    } else {}
  }

  // Auth Phone Sign In

// New Sign IN

  @override
  Future<void> verifyPhoneNumber(
      {required BuildContext context,
      required TextEditingController phoneController}) async {
    PhoneVerificationCompleted verificationCompleted =
        (phoneAuthCredential) async {
      try {
        await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      } catch (e) {
        log("Failed to sign in: $e");
      }
    };

    PhoneVerificationFailed verificationFailed = (error) {
      showErrorDialog(context, error.toString());
    };

    PhoneCodeSent codeSent = (verificationId, forceResendingToken) async {
      // create candidate
      // CreateCandidateController controller =
      //     Get.find<CreateCandidateController>();
      // controller.phoneNumber.value = "+91 ${phoneController.text.trim()}";
      // routing
      await Get.offNamed(RouteHelper.getUserOtpScreen(), arguments: {
        'verificationId': verificationId,
      });
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {};

    try {
      progressDialog(context: context, isLoading: true);
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "${phoneController.text.trim()}",
        // timeout: const Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
      progressDialog(context: context, isLoading: false);
    } catch (e) {
      showErrorDialog(context, "Failed to Verify Phone Number: $e");
    }
  }

  @override
  Future<void> signInWithPhoneNumber({
    required String otpController,
    required String verId,
    required BuildContext context,
  }) async {
    AuthCredential credential;

    try {
      progressDialog(context: context, isLoading: true);

      credential = PhoneAuthProvider.credential(
        verificationId: verId,
        smsCode: otpController,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      final user = FirebaseAuth.instance.currentUser;

      // String id = user.uid;
      //here you can store user data in backend
      // create candidate
      // CreateCandidateController controller =
      //     Get.find<CreateCandidateController>();
      // controller.isVerify.value = true;
      // controller.authId.value = user!.uid;
      //routing
      // await Get.offNamed(
      // RouteHelper.getSplashRoute(),
      // );

      progressDialog(context: context, isLoading: false);
    } catch (e) {
      showErrorDialog(context, "Failed to sign in: $e");
    }
  }
}
