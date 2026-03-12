import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter',
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF13768E), // FOI Teal/Blue
        primary: const Color(0xFF13768E),
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        // Login Header: "Explore faith with honesty. No judgment."
        displayLarge: TextStyle(
          fontSize: 48.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF3F2109), // Brownish color from image
          height: 1.1,
          fontFamily: 'PP Cirka',
        ),
        displayMedium: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF3F2109), // Brownish color from image
          height: 1.1,
          fontFamily: 'PP Cirka',
        ),
        // Social Button Text
        labelLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        // Divider "or"
        bodyMedium: TextStyle(fontSize: 14.sp, color: Colors.black),
        // Footer text
        bodySmall: TextStyle(fontSize: 12.sp, height: 1.5, color: Colors.black),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
