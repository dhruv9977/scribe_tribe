// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:scribetribe/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'package:scribetribe/data/repository/login_repo.dart';

import '../components/constants/route_helper.dart';
import '../components/constants/urls.dart';
import '../components/widgets/show_error_dialog.dart';
import '../services/auth/auth_service.dart';

class LoginController extends GetxController implements GetxService{
  final formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController().obs;
  final otpController = TextEditingController().obs;
  final isLoading = false.obs;

  final LoginRepository loginRepository;
  LoginController({
    required this.loginRepository,
  });

  getSignatureApp() async {
    await SmsAutoFill().getAppSignature;
  }

  _listenSmsCode() async {
    await SmsAutoFill().listenForCode();
  }

  void onPressed(BuildContext context) async {
    try {
      if (formKey.currentState!.validate()) {
        Response response = await loginRepository.createCandidate(
          LoginModel(
            phone: "+91${phoneController.value.text.trim()}",
          ),
        );
        if (response.statusCode == 200) {
          Get.offNamedUntil(
            RouteHelper.getUserOtpScreen(),
            (route) => false,
          );
        } else {
          showErrorDialog(context, response.statusText.toString());

          print(response.statusCode.toString());
          print(response.statusText);
        }
        getSignatureApp();
        _listenSmsCode();
      }
    } on Exception catch (e) {
      showErrorDialog(context, e.toString());
    }
  }

  void onOTPPressed(BuildContext context) async {
    try {
      if (otpController.value.text.length == 6) {
        Response response = await loginRepository.verifyCandidate(
          OtpModel(
            otp: otpController.value.text.trim(),
            phone: "+91${phoneController.value.text.trim()}",
          ),
        );
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.setString(
          UrlConstants.phoneNumber,
          "+91${phoneController.value.text.trim()}",
        );
        if (response.statusCode == 200) {
          await Get.offNamedUntil(
            RouteHelper.getChooseScreen(),
            (route) => false,
          );
        } else {
          showErrorDialog(context, response.statusText.toString());

          print(response.statusCode.toString());
          print(response.statusText);
        }
      }
    } catch (e) {
      showErrorDialog(context, e.toString());
    }
  }

  void onWriterPressed(BuildContext context) async {
    try {
      Response response = await loginRepository.loginWriterCandidate(
        LoginModel(
          phone: "+91${phoneController.value.text.trim()}",
        ),
      );
      if (response.statusCode == 400) {
        Get.offNamedUntil(
          RouteHelper.getRegistrationScreen(),
          (route) => false,
        );
        print(response.body);
      } else {
        Get.offNamedUntil(
          RouteHelper.getHomeScreen(),
          (route) => false,
        );
        print(response.body);
        print(response.statusCode.toString());
        print(response.statusText);
      }
    } catch (e) {
      showErrorDialog(context, e.toString());
    }
  }

  void onTribePressed(BuildContext context) async {
    try {
      Response response = await loginRepository.loginTribeCandidate(
        LoginModel(
          phone: "+91${phoneController.value.text.trim()}",
        ),
      );
      if (response.statusCode == 400) {
        Get.offNamedUntil(
          RouteHelper.getStudentNameScreen(),
          (route) => false,
        );
        print(response.body);
      } else {
        Get.offNamedUntil(
          RouteHelper.getStudentHomeScreen(),
          (route) => false,
        );
        print(response.body);
        print(response.statusCode.toString());
        print(response.statusText);
      }
    } catch (e) {
      showErrorDialog(context, e.toString());
    }
  }
}
