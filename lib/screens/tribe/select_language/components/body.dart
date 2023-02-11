import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribetribe/components/constants/size_config.dart';
import 'package:scribetribe/components/widgets/app_name_widgets.dart';
import 'package:scribetribe/components/widgets/text_form_field.dart';
import 'package:scribetribe/controllers/tribe_details_controller.dart';
import 'package:scribetribe/screens/tribe/tribe_details/tribe_details.dart';

import '../../../../components/constants/colors.dart';
import '../../../../components/constants/route_helper.dart';
import '../../../../components/widgets/normal_text_widget.dart';
import '../../../../components/widgets/rounded_buttons.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

String selected = "";
List checkListItems = [
  {
    "id": 0,
    "value": false,
    "title": "English",
  },
  {
    "id": 1,
    "value": false,
    "title": "Hindi",
  },
  {
    "id": 2,
    "value": false,
    "title": "Gujarati",
  },
];

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(26),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          appNameWidget(),
          buildSizeHeight(height: 46),
          buildText(
            text: "Which languages are you comfortable writing in?",
            color: AppColors.kPrimaryColor,
            txtSize: 24,
            fontWeight: FontWeight.w700,
          ),
          buildSizeHeight(height: 40),
          Column(
            children: List.generate(
              checkListItems.length,
              (index) => CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                dense: true,
                title: Text(
                  checkListItems[index]["title"],
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                value: checkListItems[index]["value"],
                onChanged: (value) {
                  setState(() {
                    for (var element in checkListItems) {
                      // element["value"] = false;
                    }
                    checkListItems[index]["value"] = value;
                  });
                },
              ),
            ),
          ),
          // buildTextFormField(
          //   controller: controller.selectLanguageController.value,
          //   keyboardType: TextInputType.text,
          //   hintText: "Select",
          //   errorText: "Please enter your prefered language",
          //   icon: CupertinoIcons.square_pencil,
          //   // isSuffixIconVisible: true,
          //   // suffixIcon: Icons.arrow_drop_down,
          //   // onIconPressed: () {},
          // ),
          // const Spacer(),
          GetBuilder(builder: (context) {
            return RoundedButton(
              text: "Next",
              btnColor: AppColors.kPrimaryColor,
              width: double.infinity,
              height: 51,
              onPressed: () {
                // if (controller.formKey.currentState!.validate()) {
                Get.offNamedUntil(
                    RouteHelper.getHomeScreen(), (route) => false);
                // }
              },
            );
          }),
          const Spacer(),
        ],
      ),
    );
  }
}
