import 'package:flutter/material.dart';
import '../constants/size_config.dart';

Text buildText({
  String text = "",
  double txtSize = 15,
  FontWeight fontWeight = FontWeight.w500,
  Color color = Colors.black,
}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: getProportionateScreenWidth(txtSize),
    ),
  );
}
