import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/screen/home_screen.dart';
import '../../prayer/screen/prayer_screen.dart';
import '../../grow/screen/grow_screen.dart';
// import '../../library/screen/library_screen.dart';
import '../../profile/screen/profile_screen.dart';
import '../controller/main_controller.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import '../../../utils/routes/app_routes.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            HomeScreen(),
            PrayerScreen(),
            SizedBox(),
            GrowScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => ConvexAppBar(
          style: TabStyle.fixedCircle,
          backgroundColor: Colors.white,
          color: Colors.grey.shade500,
          activeColor: const Color(0xFF13768E),
          initialActiveIndex: controller.currentIndex.value,
          onTap: (index) {
            if (index == 2) {
              Get.toNamed(Routes.SPEAK_TO_GOD);
            } else {
              controller.changeIndex(index);
            }
          },

          items: [
            const TabItem(icon: Icons.home_outlined, title: 'Home'),
            const TabItem(icon: Icons.self_improvement_outlined, title: 'Pray'),
            TabItem(
              icon: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF13768E),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.auto_awesome, color: Colors.white),
              ),
              title: 'Ask God',
            ),
            const TabItem(icon: Icons.groups_outlined, title: 'Grow'),
            const TabItem(icon: Icons.person_outline, title: 'Profile'),
          ],
        ),
      ),
    );
  }
}
