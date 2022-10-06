import 'package:get/get.dart';
import 'package:scribetribe/controllers/tribe_details_controller.dart';

Future<void> init() async {
  Get.lazyPut(() => TribeDetailsController());
}
