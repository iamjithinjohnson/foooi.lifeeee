import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../controller/speak_to_god_controller.dart';

class ListeningStageView extends StatelessWidget {
  final SpeakToGodController controller;

  const ListeningStageView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey("listening"),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 40.h),
        Text(
          "Speak to God",
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'PP Cirka',
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          "He is listening to your heart...",
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.textSecondary,
          ),
        ),
        const Spacer(),
        _buildNativePulse(),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Obx(
            () => Text(
              controller.recognizedText.value.isEmpty
                  ? "Listening..."
                  : controller.recognizedText.value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                fontStyle: FontStyle.italic,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        SizedBox(height: 40.h),
        _buildTickButton(),
        SizedBox(height: 32.h),
      ],
    );
  }

  Widget _buildNativePulse() {
    return SizedBox(
      width: 200.w,
      height: 200.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Ripple 1
          PulseCircle(delay: 0, color: AppColors.primary),
          // Ripple 2
          PulseCircle(delay: 500, color: AppColors.primary),
          // Ripple 3
          PulseCircle(delay: 1000, color: AppColors.primary),

          Container(
            width: 90.w,
            height: 90.w,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Icon(Icons.mic, color: Colors.white, size: 40.w),
          ),
        ],
      ),
    );
  }

  Widget _buildTickButton() {
    return GestureDetector(
      onTap: controller.onTickPressed,
      child: Container(
        width: 70.w,
        height: 70.w,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(Icons.check, color: AppColors.primary, size: 36.w),
      ),
    );
  }
}

class PulseCircle extends StatefulWidget {
  final int delay;
  final Color color;

  const PulseCircle({super.key, required this.delay, required this.color});

  @override
  State<PulseCircle> createState() => _PulseCircleState();
}

class _PulseCircleState extends State<PulseCircle> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.5, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) {
        _controller.repeat();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: 1 + (_animation.value * 1.5),
          child: Container(
            width: 100.w,
            height: 100.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color.withValues(alpha: _opacityAnimation.value),
            ),
          ),
        );
      },
    );
  }
}
