import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribetribe/models/student_edu_details.dart';

import '../components/constants/route_helper.dart';
import '../components/widgets/show_error_dialog.dart';
import '../data/repository/student_details_repo.dart';

class StudentExamDetailsController extends GetxController
    implements GetxService {
  final StudentsDetailsRepository studentsDetailsRepository;

  final examNameController = TextEditingController().obs;
  final subjectNameController = TextEditingController().obs;
  final examLanguageController = TextEditingController().obs;
  final examDateController = TextEditingController().obs;
  final examTimeController = TextEditingController().obs;
  final examDurationController = TextEditingController().obs;
  final examCityController = TextEditingController().obs;
  final examAreaController = TextEditingController().obs;
  final venueNameController = TextEditingController().obs;
  // final examSubjectController = TextEditingController().obs;
  StudentExamDetailsController({
    required this.studentsDetailsRepository,
  });

  postDetails(BuildContext context) async {
    try {
      StudentEduDetails studentsDetailsModels = StudentEduDetails(
        centerAddress: examAreaController.value.text.trim(),
        centerCity: examCityController.value.text.trim(),
        centerName: venueNameController.value.text.trim(),
        centerState: "Gujarat",
        examSubject: subjectNameController.value.text.trim(),
        examDate: examDateController.value.text.trim(),
        examDuration: int.parse(examDurationController.value.text.trim()),
        examLanguage: examLanguageController.value.text.trim(),
        examTiming: examTimeController.value.text.trim(),
        needyId: "63e2aa9a51fe6a635eb5b267",
      );
      Response response = await studentsDetailsRepository
          .postExamDetails(studentsDetailsModels);

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
  }
}
