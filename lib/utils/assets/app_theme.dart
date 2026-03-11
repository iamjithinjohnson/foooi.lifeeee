import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter',
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF00A370),
        primary: const Color(0xFF00A370),
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        // Login: "Welcome Back!"
        displayLarge: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF1A1A1A),
        ),
        // Registration: "Start your journey to wealth."
        displayMedium: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF1A1A1A),
        ),
        // Subtitle 1: "Access your secure chit accounts"
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          color: const Color(0xFF65767E),
        ),
        // Subtitle 2: "Join our secure chit fund platform today."
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          color: const Color(0xFF65767E),
        ),
        // Overline: "CREATE YOUR ACCOUNT"
        titleMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xFFB0BCC3),
          letterSpacing: 1,
        ),
        // Form field labels: "PASSWORD / PIN"
        labelLarge: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF65767E),
          letterSpacing: 0.5,
        ),
        // Action links/Green text: "Forgot PIN?", "Join a Chit Group"
        labelMedium: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF00A370),
        ),
        // Small footer text or credits
        labelSmall: TextStyle(
          fontSize: 10.sp,
          color: const Color(0xFFB0BCC3),
        ),
      ),
    );
  }
}
