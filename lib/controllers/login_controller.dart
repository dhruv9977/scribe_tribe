import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../components/widgets/show_error_dialog.dart';
import '../services/auth/auth_service.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController().obs;
  final otpController = TextEditingController().obs;
  final isLoading = false.obs;

  getSignatureApp() async {
    await SmsAutoFill().getAppSignature;
  }

  _listenSmsCode() async {
    await SmsAutoFill().listenForCode();
  }

  void onPressed(BuildContext context) async {
    try {
      if (formKey.currentState!.validate()) {
        await AuthService.firebase().verifyPhoneNumber(
          context: context,
          phoneController: phoneController.value,
        );
        getSignatureApp();
        _listenSmsCode();
      }
    } on Exception catch (e) {
      showErrorDialog(context, e.toString());
    }
  }

  void onOTPPressed(
      String otp, BuildContext context, String verificationId) async {
    try {
      if (otp.length == 6) {
        await AuthService.firebase().signInWithPhoneNumber(
          otpController: otp,
          context: context,
          verId: verificationId,
        );
      }
    } catch (e) {
      showErrorDialog(context, e.toString());
    }
  }

}
