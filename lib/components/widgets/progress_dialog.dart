import 'package:flutter/material.dart';
import 'package:scribetribe/components/constants/colors.dart';

import '../constants/size_config.dart';

void progressDialog({required BuildContext context, required bool isLoading}) {
  AlertDialog alertDialog = AlertDialog(
    clipBehavior: Clip.antiAlias,
    insetPadding: EdgeInsets.symmetric(
      horizontal: getProportionateScreenWidth(111),
      vertical: getProportionateScreenHeight(307),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    content: FittedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(33),
          ),
          const CircularProgressIndicator(
            color: AppColors.kPrimaryColor,
            strokeWidth: 3,
          ),
          SizedBox(
            height: getProportionateScreenHeight(29),
          ),
          Text(
            "Verifying...",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(15),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );

  isLoading
      ? showDialog(
          context: context,
          builder: (BuildContext context) {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pop(true);
            });
            return alertDialog;
          },
        )
      : Container();
}
