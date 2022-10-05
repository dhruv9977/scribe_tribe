import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/size_config.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildSizeHeight(height: 48),
        Text(
          "SCRIBE\nTRIBE",
          style: GoogleFonts.kronaOne(
            color: AppColors.kPrimaryColor,
            fontSize: getProportionateScreenWidth(24),
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
