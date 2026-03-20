import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/widgets/ww_primary_button.dart';
import 'package:get/get.dart';
import 'package:foi/utils/assets/image_assets.dart';
import 'package:flutter_tts/flutter_tts.dart';

class PrayerContentScreen extends StatefulWidget {
  const PrayerContentScreen({super.key});

  @override
  State<PrayerContentScreen> createState() => _PrayerContentScreenState();
}

class _PrayerContentScreenState extends State<PrayerContentScreen>
    with TickerProviderStateMixin {
  final FlutterTts flutterTts = FlutterTts();
  late AnimationController _fadeController;
  late AnimationController _contentFadeController;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  bool _isSpeaking = false;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _contentFadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _fadeController.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) _contentFadeController.forward();
      });
    });

    _initTts();
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1); // Slightly lower for masculine depth
    await flutterTts.setSpeechRate(0.40); // Slow, reverent pace

    // Attempt to find a "male" voice
    try {
      final List<dynamic>? voices = await flutterTts.getVoices;
      if (voices != null) {
        // Prioritize Rishi for a natural male tone
        final targetVoice = voices.firstWhere(
          (voice) => voice["name"].toString().contains("Daniel"),
          orElse: () => voices.firstWhere((voice) {
            final String gender =
                voice["gender"]?.toString().toLowerCase() ?? "";
            return gender == "male" || gender == "man";
          }, orElse: () => null),
        );

        if (targetVoice != null) {
          await flutterTts.setVoice({
            "name": targetVoice["name"],
            "locale": targetVoice["locale"],
          });
          // Update language to match the voice locale if needed
          if (targetVoice["locale"] != null) {
            await flutterTts.setLanguage(targetVoice["locale"]);
          }
        }
      }
    } catch (e) {
      log('Error setting voice: $e');
    }
    // Fallback to default if voice selection fails

    flutterTts.setStartHandler(() {
      setState(() => _isSpeaking = true);
    });

    flutterTts.setCompletionHandler(() {
      setState(() => _isSpeaking = false);
    });

    // Start speaking automatically
    final Map<String, dynamic> args = Get.arguments ?? {};
    final String content = args['content'] ?? '';
    if (content.isNotEmpty) {
      // Small delay for audio to match animation
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (mounted) flutterTts.speak(content);
      });
    }
  }

  @override
  void dispose() {
    flutterTts.stop();
    _fadeController.dispose();
    _contentFadeController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};
    final String title = args['title'] ?? '✨ A Prayer for You';
    final String description =
        args['description'] ??
        'Take a deep breath. Let these words settle in your heart.';
    final String content =
        args['content'] ??
        'Lord, I come to You in this moment of need. I release my worries and anxieties into Your hands. Fill me with Your peace that surpasses all understanding. Guide my steps today and help me trust in Your perfect plan. In Jesus\' name, Amen.';
    final String? verse = args['verse'];
    final String? reference = args['reference'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Header Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsImage.bg_2),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          flutterTts.stop();
                          Get.back();
                        },
                        icon: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF1F5F9),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: const Color(0xFF1E293B),
                            size: 18.w,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_isSpeaking) {
                            flutterTts.stop();
                            setState(() => _isSpeaking = false);
                          } else {
                            flutterTts.speak(content);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                _isSpeaking
                                    ? Icons.volume_up
                                    : Icons.volume_off_outlined,
                                size: 18.w,
                                color: _isSpeaking ? Colors.blue : Colors.black,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                _isSpeaking ? 'Listening...' : 'Read Aloud',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 100.h),
                        FadeTransition(
                          opacity: _fadeController,
                          child: Column(
                            children: [
                              Text(
                                title.toUpperCase(),
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF1E293B),
                                    ),
                              ),
                              SizedBox(height: 8.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40.w),
                                child: Text(
                                  description,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: const Color(0xFF64748B),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 48.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Icon(
                                  Icons.format_quote,
                                  size: 60.w,
                                  color: const Color(0xFFE2E8F0),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.h, left: 10.w),
                                child: Column(
                                  children: [
                                    FadeTransition(
                                      opacity: _contentFadeController,
                                      child: Text(
                                        content,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                              fontSize: 24.sp,
                                              height: 1.4,
                                              color: const Color(0xFF0F172A),
                                            ),
                                      ),
                                    ),
                                    if (verse != null && verse.isNotEmpty) ...[
                                      SizedBox(height: 32.h),
                                      FadeTransition(
                                        opacity: _contentFadeController,
                                        child: Container(
                                          padding: EdgeInsets.all(16.w),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF1F5F9),
                                            borderRadius: BorderRadius.circular(
                                              16.r,
                                            ),
                                            border: Border.all(
                                              color: const Color(0xFFE2E8F0),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                verse,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontStyle: FontStyle.italic,
                                                  color: const Color(
                                                    0xFF475569,
                                                  ),
                                                  height: 1.5,
                                                ),
                                              ),
                                              if (reference != null) ...[
                                                SizedBox(height: 8.h),
                                                Text(
                                                  reference.toUpperCase(),
                                                  style: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color(
                                                      0xFF1E293B,
                                                    ),
                                                    letterSpacing: 1.1,
                                                  ),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 48.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: ScaleTransition(
                            scale: _pulseAnimation,
                            child: WwPrimaryButton(
                              text: 'Amen. I’m Done',
                              onPressed: () {
                                flutterTts.stop();
                                Get.back();
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 32.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
