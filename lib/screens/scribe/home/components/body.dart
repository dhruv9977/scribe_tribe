import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribetribe/components/constants/colors.dart';
import 'package:scribetribe/components/constants/route_helper.dart';
import 'package:scribetribe/components/constants/size_config.dart';
import 'package:scribetribe/components/widgets/normal_text_widget.dart';
import 'package:scribetribe/components/widgets/rounded_buttons.dart';
import 'package:scribetribe/controllers/tribe_home_screen_controller.dart';
import 'package:scribetribe/services/auth/auth_service.dart';

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
        _buildListView(),
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
        text: "Accepted Requests",
        color: AppColors.kPrimaryColor,
        txtSize: 24,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Expanded _buildListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _buildCard();
        },
      ),
    );
  }

  Padding _buildCard() {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(17),
        right: getProportionateScreenWidth(17),
        bottom: getProportionateScreenHeight(31),
      ),
      child: SizedBox(
        height: getProportionateScreenHeight(176),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          child: _buildCardFields(),
        ),
      ),
    );
  }

  Widget _buildCardFields() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSizeHeight(height: 25),
                  buildText(
                    text: "Dhruv",
                    txtSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  buildSizeHeight(height: 4),
                  buildText(
                    text: "19 years | Paldi",
                    color: const Color(0xff9D9D9D),
                    txtSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.volume_up),
              ),
            ],
          ),
          buildSizeHeight(height: 8),
          buildText(
            text: "Writing Languages: Hindi, Gujarati, English",
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
              await AuthService.firebase().logOut();
              Get.offNamedUntil(RouteHelper.initial, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
