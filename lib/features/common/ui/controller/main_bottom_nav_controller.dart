import 'package:get/get.dart';

class MainBottomNavController extends GetxController {
  int _currentIndex = 0;

  int get selectedIndex => _currentIndex;

  void changeIndex(int index) {
    if (index == _currentIndex) {
      print("$_currentIndex when check the index");
      return;
    }
    _currentIndex = index;
    print("$_currentIndex after change the index");
    update();
  }

  void moveToCategory() {
    changeIndex(1);
    print("$_currentIndex when check the index move to category");
  }

  void moveToHome() {
    changeIndex(0);
    print("$_currentIndex when check the index move to home");
  }
}
