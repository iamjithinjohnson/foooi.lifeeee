import 'package:flutter/material.dart';
import 'dart:math' as math;

class BumpNotchedRectangle extends NotchedShape {
  const BumpNotchedRectangle();

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null || !host.overlaps(guest)) {
      return Path()..addRect(host);
    }

    final double notchRadius = guest.width / 2.0;

    const double s1 = 15.0;
    const double s2 = 1.0;

    final double r = notchRadius;
    final double a = -1.0 * r - s2;
    // final double b = host.top;

    final double n2 = math.sqrt(math.pow(r + s2, 2) - math.pow(r + s1, 2));

    final double p2x = a + n2;
    // final double p2y = math.sqrt(math.pow(r + s2, 2) - math.pow(p2x - a, 2)) + b;

    return Path()
      ..moveTo(host.left, host.top)
      ..lineTo(p2x, host.top)
      ..arcToPoint(
        Offset(guest.center.dx + (guest.width / 2) + s1, host.top),
        radius: Radius.circular(notchRadius + s2),
        clockwise: false,
      )
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
  }
}
