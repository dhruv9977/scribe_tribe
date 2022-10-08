import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribetribe/components/constants/size_config.dart';
import 'package:scribetribe/controllers/tribe_details_controller.dart';
import '../../../../components/widgets/text_form_field.dart';

class RegistrationFields extends StatelessWidget {
  const RegistrationFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TribeDetailsController>();

    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            buildTextFormField(
              controller: controller.nameController.value,
              hintText: "Name",
              icon: Icons.person,
              errorText: "Please enter your name",
              keyboardType: TextInputType.name,
            ),
            buildSizeHeight(height: 14),
            buildTextFormField(
              controller: controller.ageController.value,
              hintText: "Age",
              icon: Icons.calendar_today_rounded,
              errorText: "Please enter your age",
              keyboardType: TextInputType.number,
            ),
            buildSizeHeight(height: 14),
            buildTextFormField(
              controller: controller.cityController.value,
              hintText: "City",
              icon: CupertinoIcons.building_2_fill,
              errorText: "Please enter your city",
              keyboardType: TextInputType.name,
            ),
            buildSizeHeight(height: 14),
            buildTextFormField(
              controller: controller.areaController.value,
              hintText: "Area",
              icon: Icons.location_on_sharp,
              errorText: "Please enter your area",
              keyboardType: TextInputType.streetAddress,
            ),
          ],
        ),
      ),
    );
  }
}
