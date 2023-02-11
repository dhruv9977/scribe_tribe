// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:scribetribe/data/repository/tribe_repo.dart';
import 'package:scribetribe/models/tribe_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/constants/route_helper.dart';
import '../components/constants/urls.dart';
import '../components/widgets/show_error_dialog.dart';

class TribeDetailsController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController().obs;
  final ageController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final educationController = TextEditingController().obs;
  final selectLanguageController = TextEditingController().obs;
  final genderController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  final stateController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final pinCodeController = TextEditingController().obs;

  final TribeRepo tribeRepo;
  TribeDetailsController({
    required this.tribeRepo,
  });

    void onPressed(BuildContext context) async {
      try {
        if (formKey.currentState!.validate()) {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          String? number = sharedPreferences.getString(
            UrlConstants.phoneNumber,
          );
          Response response = await tribeRepo.createCandidate(
            TribeModel(
              name: nameController.value.text.trim(),
              age: ageController.value.text.trim(),
              gender: genderController.value.text.trim(),
              education: ["ENG184"],
              preferredLanguages: ["EN313", "GU320", "HI111"],
              city: "Gandhinagar",
              state: "Gujarat",
              address: "Shree Swaminarayan Institute of Technology",
              email: emailController.value.text.trim(),
              phone: sharedPreferences.getString(
                UrlConstants.phoneNumber,
              ),
              pincode: "382428",
            ),
          );
          if (response.statusCode == 200) {
            Get.offNamedUntil(RouteHelper.getHomeScreen(), (route) => false);
          } else {
            showErrorDialog(context, response.statusText.toString());

            print(response.statusCode.toString());
            print(response.statusText);
          }
        }
      } on Exception catch (e) {
        showErrorDialog(context, e.toString());
      }
    }
  
}
