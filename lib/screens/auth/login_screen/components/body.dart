import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scribetribe/components/constants/colors.dart';
import 'package:scribetribe/components/constants/size_config.dart';
import 'package:scribetribe/components/widgets/app_name_widgets.dart';
import 'package:scribetribe/components/widgets/normal_text_widget.dart';
import 'package:scribetribe/components/widgets/rounded_buttons.dart';
import 'package:scribetribe/components/widgets/text_form_field.dart';
import 'package:scribetribe/controllers/login_controller.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../../components/constants/route_helper.dart';
import '../../../../components/widgets/text_form_outlined.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<LoginController>();
    // Future _tryPasteCurrentPhone() async {
    //   if (!mounted) return;
    //   try {
    //     final autoFill = SmsAutoFill();
    //     final phone = await autoFill.hint;
    //     if (phone == null) return;
    //     if (!mounted) return;
    //     controller.phoneController.value.text = phone;
    //   } on PlatformException catch (e) {
    //     print('Failed to get mobile number because of: ${e.message}');
    //   }
    // }

    // @override
    // void initState() {
    //   super.initState();
    //   Future<void>.delayed(
    //       const Duration(milliseconds: 300), _tryPasteCurrentPhone);
    // }

    return GetBuilder<LoginController>(builder: (controller) {
      return Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSizeHeight(height: 8),
            Center(
              child: SizedBox(
                height: 284,
                width: 284,
                child: Image.asset(
                  "assets/icons/sign_up.gif",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(18),
                top: getProportionateScreenHeight(7),
              ),
              child: buildText(
                text: "Enter Phone Number",
                color: Colors.black,
                txtSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(15),
                getProportionateScreenHeight(34),
                getProportionateScreenWidth(25),
                getProportionateScreenHeight(28),
              ),
              child: buildNewTextFormField(
                height: 50,
                width: SizeConfig.screenWidth,
                controller: controller.phoneController.value,
                keyboardType: TextInputType.number,
                hintText: "Enter Phone Number",
                errorText: "Please enter the number",
                isSuffixIconVisible: false,
              ),
            ),
            GetBuilder<LoginController>(
              builder: (controller) => Center(
                child: TextButton(
                  onPressed: () {
                    controller.onPressed(context);
                  },
                  child: buildText(
                    text: "Send OTP",
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.w400,
                    txtSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  // Padding _buildNumberWidget(BuildContext context, LoginController controller) {
  //   return
  // }
}
