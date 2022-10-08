import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scribetribe/components/constants/size_config.dart';
import 'package:scribetribe/components/widgets/normal_text_widget.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          buildText(
            text: "Great!",
            color: Colors.white,
            txtSize: 36,
            fontWeight: FontWeight.w700,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(52),
            ),
            child: SvgPicture.asset("assets/icons/reg_successful.svg"),
          ),
          buildText(
            text: "You have registered as a scribe with us",
            color: Colors.white,
            txtSize: 24,
            fontWeight: FontWeight.w700,
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
