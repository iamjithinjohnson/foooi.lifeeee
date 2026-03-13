import 'package:get/get.dart';

class LibraryController extends GetxController {
  final RxInt bottomNavIndex = 3.obs;

  void changeTab(int index) {
    bottomNavIndex.value = index;
    if (index == 0) Get.offAllNamed('/home');
    else if (index == 1) Get.toNamed('/prayer');
    else if (index == 2) Get.toNamed('/grow');
    else if (index == 4) Get.toNamed('/profile');
  }
}
