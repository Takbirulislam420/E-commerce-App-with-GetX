import 'package:get/get.dart';
import 'package:mkr_mart/core/service/network/network_client.dart';
import 'package:mkr_mart/features/auth/ui/controller/login_controller.dart';
import 'package:mkr_mart/features/auth/ui/controller/sign_up_controller.dart';
import 'package:mkr_mart/features/auth/ui/controller/verify_otp_controller.dart';
import 'package:mkr_mart/features/auth/ui/screen/login_screen.dart';
import 'package:mkr_mart/features/common/controller/auth_controller.dart';
import 'package:mkr_mart/features/common/ui/controller/main_bottom_nav_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(MainBottomNavController());
    Get.put(
      NetworkClient(
        commonHeaders: _commonHeaders(),
        onUnAuthorized: _onUnAuthorized,
      ),
    );
    Get.put(SignUpController());
    Get.put(VerifyOtpController());

    Get.put(LoginController());
  }

  void _onUnAuthorized() {
    Get.find<AuthController>().clearUserData();
    Get.to(() => LoginScreen());
  }

  Map<String, String> _commonHeaders() {
    return {
      'content-type': 'application/json',
      'token': Get.find<AuthController>().accessToken ?? "",
    };
  }
}
