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
    final controller = Get.find<LoginController>();
    Future _tryPasteCurrentPhone() async {
      if (!mounted) return;
      try {
        final autoFill = SmsAutoFill();
        final phone = await autoFill.hint;
        if (phone == null) return;
        if (!mounted) return;
        controller.phoneController.value.text = phone;
      } on PlatformException catch (e) {
        print('Failed to get mobile number because of: ${e.message}');
      }
    }

    @override
    void initState() {
      super.initState();
      Future<void>.delayed(
          const Duration(milliseconds: 300), _tryPasteCurrentPhone);
    }

    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Center(
            child: appNameWidget(),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(26),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildText(
                  text: "Register",
                  txtSize: 30,
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.w700,
                ),
                buildSizeHeight(height: 35),
                Obx(
                  () => TextFormField(
                    onTap: () => _tryPasteCurrentPhone(),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.phoneController.value,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your phone number";
                      } else {
                        return null;
                      }
                    },
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.kFillColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Enter Phone Number",
                      hintStyle: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                      ),
                      prefixIcon: Icon(
                        Icons.phone,
                        size: getProportionateScreenWidth(25),
                      ),
                    ),
                  ),
                ),
                buildSizeHeight(height: 10),
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
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }

  // Padding _buildNumberWidget(BuildContext context, LoginController controller) {
  //   return
  // }
}
