import 'package:get/get.dart';
import 'package:mkr_mart/features/common/ui/controller/main_bottom_nav_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
  }
}
