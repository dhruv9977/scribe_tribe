import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:scribetribe/components/constants/colors.dart';
import 'package:scribetribe/components/constants/route_helper.dart';
import 'package:scribetribe/components/widgets/normal_text_widget.dart';
import 'package:scribetribe/controllers/login_controller.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../../components/constants/size_config.dart';
import '../../../../components/widgets/rounded_buttons.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: _buildImg(),
          ),
          buildText(
            text: "Enter OTP",
            color: Colors.black,
            txtSize: 22,
            fontWeight: FontWeight.w500,
          ),
          buildSizeHeight(height: 31),
          _buildPin(context),
          buildSizeHeight(height: 79),
          _buildBtn(context),
          buildSizeHeight(height: 20),
          _buildResend()
        ],
      ),
    );
  }

  Row _buildResend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildText(
          text: "Didn’t receive OTP?",
          color: Colors.black,
          txtSize: 16,
          fontWeight: FontWeight.w300,
        ),
        InkWell(
          onTap: () {},
          child: buildText(
            text: " Resend",
            color: AppColors.kPrimaryColor,
            txtSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  Padding _buildImg() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(8),
      ),
      child: Image.asset("assets/icons/sign_up_1.png"),
    );
  }

  Widget _buildBtn(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(25.5),
      ),
      child: GetBuilder<LoginController>(builder: (controller) {
        return RoundedButton(
          text: "Next",
          btnColor: AppColors.kPrimaryColor,
          width: SizeConfig.screenWidth,
          height: 51,
          onPressed: () {
            controller.onOTPPressed(context);
            // Get.offNamedUntil(
            //   RouteHelper.detailsRoute,
            //   (route) => false,
            // );
            
          },
        );
      }),
    );
  }

  GetBuilder<LoginController> _buildPin(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(12),
          ),
          child: PinCodeTextField(
            appContext: context,
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,
            enablePinAutofill: true,
            pinTheme: PinTheme(
              borderWidth: 1,
              // activeColor: Colors.transparent,
              selectedFillColor: Colors.transparent,

              shape: PinCodeFieldShape.box,
              inactiveFillColor: Colors.transparent,
              borderRadius: BorderRadius.circular(14),
              fieldHeight: getProportionateScreenWidth(53),
              fieldWidth: getProportionateScreenWidth(53),
              selectedColor: Colors.black,
              disabledColor: Colors.grey,
              inactiveColor: Colors.grey,
              activeColor: AppColors.kPrimaryColor,
              activeFillColor: Colors.white,
            ),
            keyboardType: TextInputType.number,
            animationDuration: const Duration(milliseconds: 300),
            // backgroundColor: Colors.blue.shade50,
            enableActiveFill: true,
            // errorAnimationController: errorController,
            controller: controller.otpController.value,
            onCompleted: (v) {
              print("Completed");
            },
            onChanged: (value) {
              // print(value);
              // setState(() {
              //   currentText = value;
              // });
            },
            beforeTextPaste: (text) {
              print("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
          ),
        );
      },
    );
  }
}
