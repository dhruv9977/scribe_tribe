import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TribeDetailsController extends GetxController {
    final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController().obs;
  final ageController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  final areaController = TextEditingController().obs;
  final selectLanguageController = TextEditingController().obs;
}
