import 'package:get/get.dart';
import 'package:scribetribe/controllers/login_controller.dart';
import 'package:scribetribe/controllers/tribe_details_controller.dart';
import 'package:scribetribe/controllers/tribe_home_screen_controller.dart';

Future<void> init() async {
  Get.lazyPut(() => TribeDetailsController());
  Get.lazyPut(() => TribeHomeScreenController());
  Get.lazyPut(() => LoginController());
}
