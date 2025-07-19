import 'package:get/get.dart';
import 'package:mkr_mart/core/service/api_url/api_urls.dart';
import 'package:mkr_mart/core/service/network/network_client.dart';
import 'package:mkr_mart/features/auth/data/model/verify_otp_request_model.dart';
import 'package:mkr_mart/features/common/controller/auth_controller.dart';
import 'package:mkr_mart/features/common/user_data_model/user_data_model.dart';

class VerifyOtpController extends GetxController {
  //Loading state
  bool _inProgress = false;
  //Error state
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  //Data model expose
  Future<bool> verifyOtp(VerifyOtpRequestModel model) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>()
        .postRequest(ApiUrls.verifyOtpUrl, body: model.toJson());
    if (response.isSuccess) {
      await Get.find<AuthController>().saveUserData(
        response.responseData!['data']['token'],
        UserDataModel.fromJson(response.responseData!['data']['user']),
      );
      // Save user data
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
