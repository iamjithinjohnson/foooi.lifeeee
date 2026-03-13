import 'package:get/get.dart';

class ProfileController extends GetxController {
  final RxInt bottomNavIndex = 4.obs;

  final RxBool businessListing = false.obs;
  final RxBool matrimonyProfile = false.obs;

  void changeTab(int index) {
    bottomNavIndex.value = index;
    if (index == 0) Get.offAllNamed('/home');
    else if (index == 1) Get.toNamed('/prayer');
    else if (index == 2) Get.toNamed('/grow');
    else if (index == 3) Get.toNamed('/library');
  }

  void toggleBusinessListing(bool value) => businessListing.value = value;
  void toggleMatrimonyProfile(bool value) => matrimonyProfile.value = value;
}
