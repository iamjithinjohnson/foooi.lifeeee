import 'package:get/get.dart';

class GrowController extends GetxController {
  final RxInt selectedTab = 0.obs;
  final RxInt bottomNavIndex = 2.obs;

  void changeTab(int index) {
    bottomNavIndex.value = index;
    if (index == 0) {
      Get.offAllNamed('/home');
    } else if (index == 1) {
      Get.toNamed('/prayer');
    } else if (index == 2) {
      // Already here
    } else if (index == 3) {
      Get.toNamed('/library');
    } else if (index == 4) {
      Get.toNamed('/profile');
    }
  }
}
