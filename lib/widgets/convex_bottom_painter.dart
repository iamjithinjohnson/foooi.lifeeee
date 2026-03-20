import 'package:flutter/material.dart';

class ConvexBottomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    double center = size.width / 2;
    double curveHeight = 35.0;
    double curveWidth = 100.0;
    double barTop = 30.0;

    Path path = Path()
      ..moveTo(0, barTop)
      ..lineTo(center - curveWidth, barTop)
      ..quadraticBezierTo(center - curveWidth / 2, barTop, center - curveWidth / 2, barTop - curveHeight / 2)
      ..quadraticBezierTo(center, -curveHeight / 2, center + curveWidth / 2, barTop - curveHeight / 2)
      ..quadraticBezierTo(center + curveWidth / 2, barTop, center + curveWidth, barTop)
      ..lineTo(size.width, barTop)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawShadow(path, Colors.black.withOpacity(0.15), 12, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
