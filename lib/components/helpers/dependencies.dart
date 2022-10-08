import 'package:get/get.dart';
import 'package:scribetribe/controllers/login_controller.dart';
import 'package:scribetribe/controllers/studet_details_controller.dart';
import 'package:scribetribe/controllers/tribe_details_controller.dart';
import 'package:scribetribe/controllers/tribe_home_screen_controller.dart';
import 'package:scribetribe/data/repository/student_details_repo.dart';

import '../../data/api/client_api.dart';
import '../constants/urls.dart';

Future<void> init() async {
  Get.lazyPut(() => TribeDetailsController());
  Get.lazyPut(() => TribeHomeScreenController());
  Get.lazyPut(() => LoginController());

  Get.lazyPut(() => ApiClient(appBaseUrl: UrlConstants.BASE_URL));
//repo
  Get.lazyPut(() => StudentsDetailsRepository(apiClient: Get.find()));
//cont
  Get.lazyPut(
      () => StudentDetailsController(studentsDetailsRepository: Get.find()));
}
