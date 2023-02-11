import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribetribe/components/constants/colors.dart';
import 'package:scribetribe/components/constants/route_helper.dart';
import 'package:scribetribe/components/constants/size_config.dart';

import '../../../controllers/tribe_home_screen_controller.dart';
import 'components/body.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TribeHomeScreenController());
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: const Body(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(
              RouteHelper.getStudentExamScreen(),
            );
          },
          backgroundColor: AppColors.kPrimaryColor,
          child: const Text("POST"),
        ),
      ),
    );
  }
}
