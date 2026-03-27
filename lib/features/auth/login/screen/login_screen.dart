import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:foi/utils/assets/image_assets.dart';
import 'package:foi/utils/assets/svg_assets.dart';
import 'package:foi/widgets/ww_primary_button.dart';
import 'package:foi/widgets/ww_social_button.dart';
import '../controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              AssetsImage.bg_2,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
              cacheWidth: 1000,
            ),
          ),

          // White Shade Gradient
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withAlpha(0),
                    Colors.white.withAlpha(50),
                    Colors.white.withAlpha(200),
                    Colors.white,
                  ],
                  stops: const [0.0, 0.4, 0.7, 0.9],
                ),
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: 60.h),

                  // Logo
                  SvgPicture.asset(AssetsSvg.appIcon),

                  SizedBox(height: 20.h),

                  // Header Text
                  Text(
                    'Explore faith with wellness,\ninspiration and practical\nlife guidance.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),

                  SizedBox(height: 10.h),

                  // Social Buttons
                  WwSocialButton(
                    text: 'Continue with Google',
                    iconPath: AssetsSvg.google,
                    onPressed: controller.onGoogleSignIn,
                  ),

                  SizedBox(height: 12.h),

                  WwSocialButton(
                    text: 'Continue with Apple',
                    iconPath: AssetsSvg.apple,
                    onPressed: controller.onAppleSignIn,
                  ),

                  SizedBox(height: 24.h),

                  // Divider "or"
                  Text('or', style: Theme.of(context).textTheme.bodyMedium),

                  SizedBox(height: 24.h),

                  // Phone Button
                  WwPrimaryButton(
                    text: 'Continue with Phone Number',
                    onPressed: controller.onContinueWithPhone,
                    borderRadius: 30.r,
                  ),

                  SizedBox(height: 20.h),

                  // Footer Text
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodySmall,
                      children: [
                        const TextSpan(text: 'By continuing you agree to our '),
                        TextSpan(
                          text: 'User\nAgreement',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13.sp,
                          ),
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
