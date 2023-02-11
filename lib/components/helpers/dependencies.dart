import 'package:get/get.dart';
import 'package:scribetribe/controllers/login_controller.dart';
import 'package:scribetribe/controllers/studet_details_controller.dart';
import 'package:scribetribe/controllers/tribe_details_controller.dart';
import 'package:scribetribe/controllers/tribe_home_screen_controller.dart';
import 'package:scribetribe/data/repository/login_repo.dart';
import 'package:scribetribe/data/repository/repo.dart';
import 'package:scribetribe/data/repository/student_details_repo.dart';
import 'package:scribetribe/data/repository/tribe_repo.dart';
import 'package:scribetribe/models/student_edu_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/controller.dart';
import '../../controllers/studen_exam_details.dart';
import '../../data/api/client_api.dart';
import '../constants/urls.dart';

Future<void> init() async {
  //sharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  Get.lazyPut(() => TribeHomeScreenController());
  Get.lazyPut(() => ApiClient(appBaseUrl: UrlConstants.BASE_URL));
//repo
  Get.lazyPut(() => LoginRepository(apiClient: Get.find()));
  Get.lazyPut(() => StudentsDetailsRepository(apiClient: Get.find()));
  Get.lazyPut(() => TribeRepo(apiClient: Get.find()));
  Get.lazyPut(() => StudentsDetailsRepository(apiClient: Get.find()));
  Get.lazyPut(() => Repository(apiClient: Get.find()));
//controllers

  Get.lazyPut(
    () => LoginController(
      loginRepository: Get.find(),
    ),
  );
  Get.lazyPut(
    () => StudentDetailsController(
      studentsDetailsRepository: Get.find(),
    ),
  );
  Get.lazyPut(
    () => TribeDetailsController(
      tribeRepo: Get.find(),
    ),
  );
  Get.lazyPut(
    () => StudentExamDetailsController(
    studentsDetailsRepository  : Get.find(),
    ),
  );
  Get.lazyPut(
    () => PostController(
    repository  : Get.find(),
    ),
  );
}
