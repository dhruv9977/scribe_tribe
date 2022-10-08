import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/size_config.dart';

Widget appNameWidget() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildSizeHeight(height: 48),
        Text(
          "SCRIBE\nTRIBE",
          textAlign: TextAlign.center,
          style: GoogleFonts.kronaOne(
            color: AppColors.kPrimaryColor,
            fontSize: getProportionateScreenWidth(24),
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    ),
  );
}
