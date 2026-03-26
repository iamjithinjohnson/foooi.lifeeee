import 'package:get/get.dart';
import '../../../service/auth_service.dart';

class ProfileController extends GetxController {
  final RxBool businessListing = false.obs;
  final RxBool matrimonyProfile = false.obs;

  final RxString name = 'Sebastian Stan'.obs;
  final RxString email = 'sebastian.stan@example.com'.obs;
  final RxString phone = '+1 555-0123'.obs;
  final RxString bio = 'Worship Leader • Member since 2015'.obs;
  final RxString church = 'Grace Community Church'.obs;

  void toggleBusinessListing(bool value) => businessListing.value = value;
  void toggleMatrimonyProfile(bool value) => matrimonyProfile.value = value;

  void updateProfile({
    required String newName,
    required String newEmail,
    required String newPhone,
    required String newBio,
    required String newChurch,
  }) {
    name.value = newName;
    email.value = newEmail;
    phone.value = newPhone;
    bio.value = newBio;
    church.value = newChurch;
    Get.back();
    Get.snackbar('Success', 'Profile updated successfully', snackPosition: SnackPosition.BOTTOM);
  }

  void logout() {
    Get.find<AuthService>().logout();
  }
}
