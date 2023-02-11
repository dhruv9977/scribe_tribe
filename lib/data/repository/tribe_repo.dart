import 'package:get/get.dart';
import 'package:scribetribe/screens/tribe/tribe_details/tribe_details.dart';

import '../../components/constants/urls.dart';
import '../../models/tribe_home_screen_data.dart';
import '../../models/tribe_model.dart';
import '../api/client_api.dart';

class TribeRepo extends GetxService {
  final ApiClient apiClient;

  TribeRepo({
    required this.apiClient,
  });
Future<Response> createCandidate(TribeModel candidateModel) async {
    return await apiClient.postData(
      UrlConstants.REGISTER_WRITER_URL,
      candidateModel.toJson(),
    );
  }

}
