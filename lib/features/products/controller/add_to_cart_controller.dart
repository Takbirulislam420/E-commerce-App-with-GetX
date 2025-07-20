import 'package:get/get.dart';
import 'package:mkr_mart/core/service/api_url/api_urls.dart';
import 'package:mkr_mart/core/service/network/network_client.dart';

class AddToCartController extends GetxController {
  //Loading state
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  Future<bool> addToCartRequest(String productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>()
        .postRequest(ApiUrls.addToCartUrl, body: {"product": productId});
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
