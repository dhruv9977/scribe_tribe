import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribetribe/components/constants/route_helper.dart';
import 'package:scribetribe/components/widgets/app_name_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/constants/urls.dart';

class ChoosingScreen extends StatefulWidget {
  const ChoosingScreen({Key? key}) : super(key: key);

  @override
  State<ChoosingScreen> createState() => _ChoosingScreenState();
}

class _ChoosingScreenState extends State<ChoosingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              appNameWidget(),
              const SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Are you",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color(0xff4E0ADD),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 150,
                  width: 300,
                  child: OutlinedButton(
                    onPressed: () async {
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();

                      await sharedPreferences.setBool(
                          UrlConstants.isStudent, true);
                      Get.offNamedUntil(
                          RouteHelper.getStudentNameScreen(), (route) => false);
                    },
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xff4E0ADD))),
                    child: const Text(
                      "Looking for a Writer",
                      style: TextStyle(
                        color: Color(0xff4E0ADD),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 150,
                  width: 300,
                  child: OutlinedButton(
                    onPressed: () {
                      Get.offNamedUntil(RouteHelper.getRegistrationScreen(),
                          (route) => false);
                    },
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xff4E0ADD))),
                    child: const Text(
                      "a Writer",
                      style: TextStyle(
                        color: Color(0xff4E0ADD),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
