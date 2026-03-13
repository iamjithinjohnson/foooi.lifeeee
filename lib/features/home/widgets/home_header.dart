import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foi/utils/assets/image_assets.dart';
import 'package:foi/utils/assets/svg_assets.dart';
import 'package:foi/widgets/ww_gradient_button.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250.h,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 20.h,
        left: 24.w,
        right: 24.w,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsImage.bg_2),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AssetsSvg.appIcon, width: 38.w),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                'Good Morning, John',
                style: Theme.of(
                  context,
                ).textTheme.displayMedium?.copyWith(
                      fontSize: 24.sp,
                      color: const Color(0xFF1E293B),
                    ),
              ),
              WwGradientButton(
                width: 90.w,
                height: 38.h,
                text: 'Ask AI',
                fontSize: 14.sp,
                onTap: () => Get.toNamed('/bible-ai'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
