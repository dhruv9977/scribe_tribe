// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scribetribe/controllers/login_controller.dart';

import 'package:scribetribe/data/repository/student_details_repo.dart';
import 'package:scribetribe/models/students_details_model.dart';

class StudentDetailsController extends GetxController {
  final controller = Get.find<LoginController>();
  late String number;
  final nameController = TextEditingController().obs;
  final ageController = TextEditingController().obs;
  final examNameController = TextEditingController().obs;
  final subjectNameController = TextEditingController().obs;
  final examLanguageController = TextEditingController().obs;
  final examDateController = TextEditingController().obs;
  final examTimeController = TextEditingController().obs;
  final examDurationController = TextEditingController().obs;
  final examCityController = TextEditingController().obs;
  final examAreaController = TextEditingController().obs;
  final commuteController = TextEditingController().obs;

  final StudentsDetailsRepository studentsDetailsRepository;
  StudentDetailsController({
    required this.studentsDetailsRepository,
  });

  createCandidate() async {
    StudentsDetailsModels studentsDetailsModels = StudentsDetailsModels(
      name: nameController.value.text, 
    );

    Response response = await studentsDetailsRepository.createCandidate(studentsDetailsModels);

    if (response.statusCode == 201) {
      // navigation
    } else {}

    update();
  }
}
