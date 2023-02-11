import 'package:get/get.dart';
import 'package:scribetribe/models/model.dart';

import '../../components/constants/urls.dart';
import '../api/client_api.dart';

class Repository extends GetxService {
  final ApiClient apiClient;

  Repository({
    required this.apiClient,
  });

  Future<Response> createCandidate(ModelDetails loginModel) async {
    return await apiClient.postData(
      UrlConstants.POST_URL,
      loginModel.toJson(),
    );
  }
}
