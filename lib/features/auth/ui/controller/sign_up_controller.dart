import 'package:get/get.dart';
import 'package:mkr_mart/core/api_urls.dart';
import 'package:mkr_mart/core/service/network/network_client.dart';
import 'package:mkr_mart/features/auth/data/model/sign_up_request_model.dart';

class SignUpController extends GetxController {
  //Loading state
  bool _inProgress = false;
  //Error state
  String? _errorMessage;
  late String _message;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  String get message => _message;
  //Data model expose
  Future<bool> signUp(SignUpRequestModel model) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>()
        .postRequest(ApiUrls.signUpUrl, body: model.toJson());
    if (response.isSuccess) {
      _message = response.responseData!['msg'];
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
