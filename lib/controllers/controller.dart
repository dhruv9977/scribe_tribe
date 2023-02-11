// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:scribetribe/data/repository/repo.dart';
import 'package:scribetribe/models/detail.dart';
import 'package:scribetribe/models/model.dart';

import '../components/constants/route_helper.dart';
import '../components/widgets/show_error_dialog.dart';

class PostController extends GetxController implements GetxService {
  final Repository repository;
  PostController({
    required this.repository,
  });
  void onPressed(BuildContext context) async {
    try {
      Response response = await repository.createCandidate(
        ModelDetails(
          writerId: "63e2a629b75bc4941fe5e6ac",
        ),
      );
      print(response.body["centerCity"]);
      if (response.statusCode == 200) {
        Get.offNamedUntil(RouteHelper.getDetailScreen(), (route) => false);
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
