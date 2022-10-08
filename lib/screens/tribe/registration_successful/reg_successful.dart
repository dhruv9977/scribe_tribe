import 'package:flutter/material.dart';
import 'package:scribetribe/components/constants/colors.dart';

import 'components/body.dart';

class RegistrationSuccessfulScreen extends StatelessWidget {
  const RegistrationSuccessfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: Body(),
      ),
    );
  }
}
