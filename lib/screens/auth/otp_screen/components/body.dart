import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:scribetribe/components/constants/colors.dart';
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
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    String verificationId = arguments['verificationId'].toString();
    LoginController controller = Get.find<LoginController>();
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            _buildText(
              "Welcome back\nsmarika verma!",
              AppColors.kPrimaryColor,
              21.5,
            ),
            buildSizeHeight(height: 4),
            Text(
              "We have sent OTP via SMS to",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: const Color(0xff717171),
                fontWeight: FontWeight.w400,
              ),
            ),
            _buildRichText(controller),
            buildSizeHeight(height: 20),
            _buildPin(context, controller, verificationId),
            buildSizeHeight(height: 20),
            _buildBtn(context, controller),
            buildSizeHeight(height: 16),
            _buildText(
              "You are already registred.\nPlease enter OTP to move ahed.",
              const Color(0xff34A853),
              13,
            ),
            const Spacer(),
            _buildText(
              "Didn’t receive OTP?",
              const Color(0xff666666),
              12,
            ),
            buildSizeHeight(height: 15),
            _buildTimer(),
            buildSizeHeight(height: 11),
            _buildText(
              "OR",
              const Color(0xff717171),
              12,
            ),
            buildSizeHeight(height: 11),
            buildText(
              text: "Verify using call",
              color: AppColors.kPrimaryColor,
              txtSize: 12,
              fontWeight: FontWeight.w500,
            ),
            buildSizeHeight(height: 39),
          ],
        ),
      ),
    );
  }

  Widget _buildRichText(LoginController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          controller.phoneController.value.text.trim(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(18),
          ),
        ),
        Text(
          " for verification",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: const Color(0xff717171),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Padding _buildBtn(BuildContext context, LoginController controller) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: RoundedButton(
        text: "Verify",
        btnColor: AppColors.kPrimaryColor,
        width: double.infinity,
        height: 41,
        onPressed: () {},
        fontSize: 12,
      ),
    );
  }

  Text _buildText(String text, Color color, double size) {
    return Text(
      text,
      style: TextStyle(
        fontSize: getProportionateScreenWidth(size),
        color: color,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildPin(
      BuildContext context, LoginController controller, String verificationId) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(12),
      ),
      child: Obx(
        () => PinFieldAutoFill(
          controller: controller.otpController.value,
          codeLength: 6,
          autoFocus: true,
          cursor: Cursor(
            color: Colors.black45,
            enabled: true,
            width: 2,
            height: 20,
          ),
          enableInteractiveSelection: true,
          decoration: UnderlineDecoration(
            lineHeight: 2,
            lineStrokeCap: StrokeCap.butt,
            bgColorBuilder: PinListenColorBuilder(
              AppColors.kFillColor,
              AppColors.kFillColor,
            ),
            colorBuilder: const FixedColorBuilder(AppColors.kFillColor),
          ),
          onCodeChanged: (p0) {
            if (p0!.length == 6) {
              controller.onOTPPressed(p0, context, verificationId);
            }
          },
        ),
      ),
    );
  }

  Row _buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder(
          tween: Tween(
            begin: 30.0,
            end: 0.0,
          ),
          duration: const Duration(
            seconds: 30,
          ),
          builder: (_, double value, child) => Text(
            "Retry in ${value.toInt()} sec",
            style: TextStyle(
              color: const Color(0xffD9D9D9),
              fontSize: getProportionateScreenWidth(12),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
