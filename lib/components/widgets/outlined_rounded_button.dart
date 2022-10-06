import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/size_config.dart';
import 'normal_text_widget.dart';

class OutlinedRoundedButton extends StatelessWidget {
  const OutlinedRoundedButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(51),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          padding: EdgeInsets.zero,
          side: const BorderSide(
            width: 1,
            color: AppColors.kPrimaryColor,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on_rounded,
              color: AppColors.kPrimaryColor,
              size: 32,
            ),
            buildSizeWidth(
              width: getProportionateScreenWidth(15),
            ),
            buildText(
              text: "Detect My Location",
              txtSize: 20,
              color: AppColors.kPrimaryColor,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}
