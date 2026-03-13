import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controller/prayer_controller.dart';

class CategoryGrid extends GetView<PrayerController> {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(16.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.6,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 12.h,
      ),
      itemCount: controller.categories.length,
      itemBuilder: (context, index) {
        final category = controller.categories[index];
        return GestureDetector(
          onTap: () => Get.toNamed('/prayer-content'),
          child: Column(
            children: [
              SvgPicture.asset(category['icon']!),
              SizedBox(height: 8.h),
              Text(
                category['title']!,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
