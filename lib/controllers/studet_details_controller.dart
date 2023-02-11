// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scribetribe/controllers/login_controller.dart';

import 'package:scribetribe/data/repository/student_details_repo.dart';
import 'package:scribetribe/models/students_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/constants/route_helper.dart';
import '../components/constants/urls.dart';
import '../components/widgets/show_error_dialog.dart';

class StudentDetailsController extends GetxController implements GetxService {
  final formKey = GlobalKey<FormState>();

  // final controller = Get.find<LoginController>();
  late String number;
  final nameController = TextEditingController().obs;
  final ageController = TextEditingController().obs;
  final genderController = TextEditingController().obs;
  final languageController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  final stateController = TextEditingController().obs;
  final pinCodeController = TextEditingController().obs;
  final addressController = TextEditingController().obs;

// final education = languageController.value.text.trim().toLowerCase() == "english"
//               ? "ENG184"
//               : "";
  final commuteController = TextEditingController().obs;

  final StudentsDetailsRepository studentsDetailsRepository;
  StudentDetailsController({
    required this.studentsDetailsRepository,
  });

  createCandidate(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      StudentDetailsModel studentsDetailsModels = StudentDetailsModel(
        name: nameController.value.text.trim(),
        age: ageController.value.text.trim(),
        gender: genderController.value.text.trim(),
        education: ["ENG184"],
        city: cityController.value.text.trim(),
        state: stateController.value.text.trim(),
        address: addressController.value.text.trim(),
        // "${cityController.value.text.trim()}, ${stateController.value.text.trim()}, ${pinCodeController.value.text.trim()}",
        pincode: pinCodeController.value.text.trim(),
        proof: '',
        phone: sharedPreferences.getString(UrlConstants.phoneNumber),
      );
      Response response = await studentsDetailsRepository
          .createCandidate(studentsDetailsModels);

      if (response.statusCode == 200) {
        Get.offNamedUntil(
          RouteHelper.getStudentHomeScreen(),
          (route) => false,
        );
      } else {
        showErrorDialog(context, response.statusText.toString());

        print(response.statusCode.toString());
        print(response.statusText);
      }
    } on Exception catch (e) {
      showErrorDialog(context, e.toString());
    }

    update();
  }
}
