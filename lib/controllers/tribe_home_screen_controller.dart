import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:scribetribe/models/tribe_home_screen_data.dart';

class TribeHomeScreenController extends GetxController {
  final data = TribeHomeScreenData().obs;

  loadData() async {
    final jsonString =
        await rootBundle.loadString("assets/files/tribe_reg.json");
    final jsonResponse = jsonDecode(jsonString);
    data.value = TribeHomeScreenData.fromJson(jsonResponse);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    loadData();
  }
}
