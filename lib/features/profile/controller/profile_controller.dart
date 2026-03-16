import 'package:get/get.dart';

class ProfileController extends GetxController {
  final RxBool businessListing = false.obs;
  final RxBool matrimonyProfile = false.obs;

  void toggleBusinessListing(bool value) => businessListing.value = value;
  void toggleMatrimonyProfile(bool value) => matrimonyProfile.value = value;
}
