import 'package:flutter/material.dart';
import '../utils/assets/image_assets.dart';

class WwAuthBackground extends StatelessWidget {
  final double top;
  final BoxFit fit;

  const WwAuthBackground({
    super.key,
    this.top = -700,
    this.fit = BoxFit.fitWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          top: top,
          child: Image.asset(AssetsImage.bg_1, fit: fit),
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
                  Colors.white,
                ],
                stops: const [0.0, 0.4],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
