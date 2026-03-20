import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';

class ProcessingStageView extends StatefulWidget {
  const ProcessingStageView({super.key});

  @override
  State<ProcessingStageView> createState() => _ProcessingStageViewState();
}

class _ProcessingStageViewState extends State<ProcessingStageView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey("processing"),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // Outer glow
            Container(
              width: 150.w,
              height: 150.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.15),
                    AppColors.primary.withValues(alpha: 0),
                  ],
                ),
              ),
            ),
            // Complex custom animation
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: CelestialPainter(_controller.value),
                  size: Size(120.w, 120.w),
                );
              },
            ),
            // Inner icon or small pulse
            Icon(
              Icons.auto_awesome_rounded,
              color: AppColors.primary,
              size: 24.w,
            ),
          ],
        ),
        SizedBox(height: 48.h),
        Text(
          "Seeking wisdom...",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'PP Cirka',
            color: AppColors.textPrimary,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          "Connecting with the Divine word",
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class CelestialPainter extends CustomPainter {
  final double progress;

  CelestialPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint60 = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final paint30 = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Draw orbits
    for (int i = 0; i < 3; i++) {
      final rotation = (progress * 2 * math.pi) + (i * math.pi / 1.5);
      final scale = 0.8 + (math.sin(progress * 2 * math.pi + i) * 0.1);
      
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(rotation);
      canvas.scale(scale);
      
      final rect = Rect.fromCircle(center: Offset.zero, radius: radius - (i * 10));
      canvas.drawArc(rect, 0, math.pi * 0.8, false, paint60);
      canvas.drawArc(rect, math.pi, math.pi * 0.3, false, paint30);
      
      // Draw a "planet" on the orbit
      final orbitPaint = Paint()
        ..color = AppColors.primary
        ..style = PaintingStyle.fill;
      
      canvas.drawCircle(Offset(radius - (i * 10), 0), 3, orbitPaint);
      
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CelestialPainter oldDelegate) => true;
}
