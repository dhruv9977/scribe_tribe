// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:scribetribe/models/students_details_model.dart';

import '../../components/constants/urls.dart';
import '../api/client_api.dart';

class StudentsDetailsRepository extends GetxService {
  final ApiClient apiClient;

  StudentsDetailsRepository({
    required this.apiClient,
  });

  Future<Response> createCandidate(StudentsDetailsModels candidateModel) async {
    return await apiClient.postData(
      UrlConstants.STUDENTS_DETAILS,
      candidateModel.toJson(),
    );
  }

  
}
