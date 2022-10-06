import 'package:flutter/material.dart';

import '../constants/size_config.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.text,
    required this.btnColor,
    required this.width,
    required this.height,
    required this.onPressed,
    this.fontSize = 24,
  }) : super(key: key);

  final String text;
  final double width, height;
  final Color btnColor;
  final VoidCallback onPressed;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(width),
      height: getProportionateScreenHeight(height),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: btnColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: getProportionateScreenWidth(fontSize),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
