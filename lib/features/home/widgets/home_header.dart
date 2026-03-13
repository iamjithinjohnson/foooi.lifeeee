import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foi/utils/assets/image_assets.dart';
import 'package:foi/utils/assets/svg_assets.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10.h,
        left: 16.w,
        right: 16.w,
        bottom: 20.h,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AssetsImage.bg_2,
          ), // Using bg_1 for the soft sky look
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(AssetsSvg.appIcon, width: 38.w),

              GestureDetector(
                onTap: () => Get.toNamed('/bible-ai'),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2B5AE1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    'Ask AI',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            'Good Morning, John',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF3F2109),
            ),
          ),
        ],
      ),
    );
  }
}
