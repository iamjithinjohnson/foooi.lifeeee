import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/features/home/widgets/continue_path_card.dart';
import 'package:foi/features/home/widgets/daily_checkin.dart';
import 'package:foi/features/home/widgets/home_header.dart';
import 'package:foi/features/home/widgets/podcasts_section.dart';
import 'package:foi/features/home/widgets/prayer_section.dart';
import 'package:foi/features/home/widgets/prayer_streak.dart';
import 'package:foi/features/home/widgets/quick_actions.dart';
import 'package:foi/features/home/widgets/scripture_card.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          const HomeHeader(),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 190.h), // Height to match header content area
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DailyCheckIn(),
                      SizedBox(height: 32.h),
                      const QuickActions(),
                      SizedBox(height: 32.h),
                      const ScriptureCard(),
                      SizedBox(height: 32.h),
                      const ContinuePathCard(),
                      SizedBox(height: 32.h),
                      const PodcastsSection(),
                      SizedBox(height: 32.h),
                      const PrayerSection(),
                      SizedBox(height: 32.h),
                      const PrayerStreak(),
                      SizedBox(height: 100.h), // Space for bottom nav
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.2))),
        ),
        child: BottomNavigationBar(
          currentIndex: controller.bottomNavIndex.value,
          onTap: controller.changeTab,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
          unselectedLabelStyle: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.grey),
          items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.self_improvement_outlined),
          activeIcon: Icon(Icons.self_improvement),
          label: 'Pray',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.groups_outlined),
          activeIcon: Icon(Icons.groups),
          label: 'Grow',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_outlined),
          activeIcon: Icon(Icons.menu_book),
          label: 'Library',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ),
          ],
        ),
      ),
    );
  }
}
