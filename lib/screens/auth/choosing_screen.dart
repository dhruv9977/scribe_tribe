import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribetribe/components/constants/colors.dart';
import 'package:scribetribe/components/constants/route_helper.dart';
import 'package:scribetribe/components/constants/size_config.dart';
import 'package:scribetribe/components/widgets/app_name_widgets.dart';
import 'package:scribetribe/components/widgets/normal_text_widget.dart';
import 'package:scribetribe/controllers/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/constants/urls.dart';

class ChoosingScreen extends StatelessWidget {
  const ChoosingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: GetBuilder<LoginController>(builder: (controller) {
        return Column(
          children: [
            // appNameWidget(),
            buildSizeHeight(height: 152),
            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(35),
                bottom: getProportionateScreenHeight(26),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildText(
                    text: "Use ScribeTribe to",
                    txtSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: getProportionateScreenHeight(220),
                width: getProportionateScreenWidth(290),
                child: OutlinedButton(
                  onPressed: () async {
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();

                    await sharedPreferences.setBool(
                      UrlConstants.isStudent,
                      false,
                    );
                    // ignore: use_build_context_synchronously
                    // controller.onWriterPressed(context);
                  },
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xff4E0ADD))),
                  child: Column(
                    children: [
                      Image.asset("assets/icons/choosing_1.png"),
                      const Text(
                        "Volunteer as Scribe",
                        style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: getProportionateScreenHeight(220),
                width: getProportionateScreenWidth(290),
                child: OutlinedButton(
                  onPressed: () async {
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();

                    await sharedPreferences.setBool(
                      UrlConstants.isStudent,
                      true,
                    );
                    // controller.onTribePressed(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xff4E0ADD),
                    ),
                  ),
                  child: Column(
                    children: [
                      Image.asset("assets/icons/choosing_2.png"),
                      const Text(
                        "Find a Scribe",
                        style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
