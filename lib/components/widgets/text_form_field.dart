import 'package:flutter/material.dart';
import 'package:scribetribe/components/constants/colors.dart';
import 'package:scribetribe/components/constants/size_config.dart';

Widget buildTextFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String hintText,
  required String errorText,
  IconData icon = Icons.abc,
  bool isSuffixIconVisible = false,
  IconData suffixIcon = Icons.abc,
  VoidCallback? onIconPressed,
}) {
  return SizedBox(
    // height: getProportionateScreenHeight(64),
    child: TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
      validator: (value) {
        if (value!.isEmpty) {
          return errorText;
        } else {
          return null;
        }
      },
      style: TextStyle(
        fontSize: getProportionateScreenWidth(20),
        color: Colors.black,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.kFillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: getProportionateScreenWidth(20),
        ),
        prefixIcon: Icon(
          icon,
          size: getProportionateScreenWidth(25),
        ),
        suffixIcon: Visibility(
          visible: isSuffixIconVisible,
          child: IconButton(
            onPressed: onIconPressed,
            icon: Icon(
              suffixIcon,
              size: getProportionateScreenWidth(25),
            ),
          ),
        ),
      ),
    ),
  );
}
