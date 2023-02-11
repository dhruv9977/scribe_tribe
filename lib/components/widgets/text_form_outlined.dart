import 'package:flutter/material.dart';

import '../constants/size_config.dart';

Widget buildNewTextFormField({
  required TextEditingController controller,
  required double height,
  required double width,
  required TextInputType keyboardType,
  required String hintText,
  required String errorText,
  IconData icon = Icons.abc,
  bool isSuffixIconVisible = false,
  IconData suffixIcon = Icons.abc,
  VoidCallback? onIconPressed,
}) {
  return SizedBox(
    // height: getProportionateScreenHeight(height),
    width: getProportionateScreenWidth(width),
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
        fontSize: getProportionateScreenWidth(16),
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xffd3d3d3)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusColor: Colors.black54,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.black54,
          ),
        ),
        contentPadding: EdgeInsets.only(
          top: getProportionateScreenHeight(16),
          bottom: getProportionateScreenHeight(16),
          left: getProportionateScreenWidth(18),
        ),
        // decoration: InputDecoration(
        //   // filled: true,
        //   // fillColor: AppColors.kFillColor,
        //   border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(5),
        //     borderSide: const BorderSide(
        //       width: 1,
        //       color: Color(0xffC4C4C4),
        //     ),
        //   ),
        //   hintText: hintText,
        //   hintStyle: TextStyle(
        //     fontSize: getProportionateScreenWidth(16),
        //   ),
        //   // prefixIcon: Icon(
        //   //   icon,
        //   //   size: getProportionateScreenWidth(25),
        //   // ),
        //   suffixIcon: Visibility(
        //     visible: isSuffixIconVisible,
        //     child: IconButton(
        //       onPressed: onIconPressed,
        //       icon: Icon(
        //         suffixIcon,
        //         size: getProportionateScreenWidth(25),
        //       ),
        //     ),
        //   ),
        // ),
      ),
    ),
  );
}
