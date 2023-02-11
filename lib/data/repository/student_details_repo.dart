// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:scribetribe/models/students_details_model.dart';

import '../../components/constants/urls.dart';
import '../../models/student_edu_details.dart';
import '../api/client_api.dart';

class StudentsDetailsRepository extends GetxService {
  final ApiClient apiClient;

  StudentsDetailsRepository({
    required this.apiClient,
  });

  Future<Response> createCandidate(StudentDetailsModel candidateModel) async {
    return await apiClient.postData(
      UrlConstants.REGISTER_TRIBE_URL,
      candidateModel.toJson(),
    );
  }

  Future<Response> postExamDetails(StudentEduDetails eduModel) async {
    return await apiClient.postData(
      UrlConstants.EXAM_POST_URL,
      eduModel.toJson(),
    );
  }
}
