import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribetribe/components/constants/colors.dart';
import 'package:scribetribe/components/constants/route_helper.dart';
import 'package:scribetribe/components/constants/size_config.dart';
import 'package:scribetribe/components/widgets/normal_text_widget.dart';
import 'package:scribetribe/components/widgets/rounded_buttons.dart';
import 'package:scribetribe/controllers/tribe_home_screen_controller.dart';
import 'package:scribetribe/services/auth/auth_service.dart';

import '../../../../controllers/controller.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<TribeHomeScreenController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildConstantText(),
        _buildListView(context),
      ],
    );
  }

  Padding _buildConstantText() {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(25),
        top: getProportionateScreenHeight(30),
        right: getProportionateScreenWidth(25),
        bottom: getProportionateScreenHeight(14),
      ),
      child: buildText(
        text: "For You",
        color: AppColors.kPrimaryColor,
        txtSize: 24,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Expanded _buildListView(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return _buildCard(context);
        },
      ),
    );
  }

  Padding _buildCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(17),
        right: getProportionateScreenWidth(17),
        bottom: getProportionateScreenHeight(31),
      ),
      child: SizedBox(
        height: getProportionateScreenHeight(195),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          child: _buildCardFields(context),
        ),
      ),
    );
  }

  Widget _buildCardFields(BuildContext context) {
    return GetBuilder<PostController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildSizeHeight(height: 25),
              buildText(
                txtSize: 20,
                fontWeight: FontWeight.w600,
              ),
              buildSizeHeight(height: 4),
              buildText(
                color: const Color(0xff9D9D9D),
                txtSize: 12,
                fontWeight: FontWeight.w600,
              ),
              buildSizeHeight(height: 8),
              buildText(
                // text: "Date: ${controller.data.value.date}",
                txtSize: 12,
                fontWeight: FontWeight.w600,
              ),
              buildSizeHeight(height: 4),
              buildText(
                // text: "Requirements: ${controller.data.value.requirement}",
                txtSize: 12,
                fontWeight: FontWeight.w600,
              ),
              buildSizeHeight(height: 17),
              RoundedButton(
                text: "View Details",
                btnColor: AppColors.kPrimaryColor,
                width: double.infinity,
                fontSize: 16,
                height: 33,
                onPressed: () async {
                  controller.onPressed(context);
                  // Get.toNamed(RouteHelper.getDetailScreen());
                  // await AuthService.firebase().logOut();
                  // Get.offNamedUntil(RouteHelper.initial, (route) => false);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
