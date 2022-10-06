import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribetribe/components/constants/colors.dart';
import 'package:scribetribe/components/constants/size_config.dart';
import 'package:scribetribe/components/widgets/normal_text_widget.dart';
import 'package:scribetribe/components/widgets/rounded_buttons.dart';
import 'package:scribetribe/controllers/tribe_details_controller.dart';

import '../../../../components/widgets/app_name_widgets.dart';
import '../../../../components/widgets/outlined_rounded_button.dart';
import 'registration_fields.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(26),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                appNameWidget(),
                buildSizeHeight(height: 46),
                buildText(
                  text: "Tell us about yourself",
                  color: AppColors.kPrimaryColor,
                  txtSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                buildSizeHeight(height: 37),
                // const Spacer(),
                const RegistrationFields(),
                buildSizeHeight(height: 51),
                OutlinedRoundedButton(
                  onPressed: () {},
                ),
                buildSizeHeight(height: 13),
                RoundedButton(
                  text: "Next",
                  btnColor: AppColors.kPrimaryColor,
                  width: double.infinity,
                  height: 51,
                  onPressed: () {},
                ),
                buildSizeHeight(height: 116),
                // const Spacer(
                //   flex: 3,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
