// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:scribetribe/data/api/client_api.dart';

import '../../components/constants/urls.dart';
import '../../models/login_model.dart';
import '../../models/students_details_model.dart';

class LoginRepository extends GetxService {
  final ApiClient apiClient;

  LoginRepository({
    required this.apiClient,
  });

  Future<Response> createCandidate(LoginModel loginModel) async {
    return await apiClient.postData(
      UrlConstants.CREATE_URL,
      loginModel.toJson(),
    );
  }

  Future<Response> verifyCandidate(OtpModel otpModel) async {
    return await apiClient.postData(
      UrlConstants.VERIFY_URL,
      otpModel.toJson(),
    );
  }

  Future<Response> loginWriterCandidate(LoginModel loginModel) async {
    return await apiClient.postData(
      UrlConstants.LOGIN_WRITER_URL,
      loginModel.toJson(),
    );
  }

  Future<Response> loginTribeCandidate(LoginModel loginModel) async {
    return await apiClient.postData(
      UrlConstants.LOGIN_TRIBE_URL,
      loginModel.toJson(),
    );
  }
}
