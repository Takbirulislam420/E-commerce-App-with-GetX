import 'package:get/get.dart';
import 'package:mkr_mart/core/service/network/network_client.dart';
import 'package:mkr_mart/features/common/ui/controller/main_bottom_nav_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(
      NetworkClient(
        commonHeaders: _commonHeaders,
        onUnAuthorized: _onUnAuthorized,
      ),
    );
  }

  void _onUnAuthorized() {}

  final Map<String, String> _commonHeaders = {
    'content-type': 'application/json',
    'token': '',
  };
}
