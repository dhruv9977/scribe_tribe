import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribetribe/components/constants/size_config.dart';
import 'package:scribetribe/controllers/tribe_home_screen_controller.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TribeHomeScreenController());
    SizeConfig().init(context);
    return const SafeArea(
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
