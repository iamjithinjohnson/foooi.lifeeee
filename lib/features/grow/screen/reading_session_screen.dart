import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/widgets/ww_primary_button.dart';
import 'package:get/get.dart';
import 'package:foi/utils/assets/image_assets.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../model/plan_session.dart';

class ReadingSessionScreen extends StatefulWidget {
  const ReadingSessionScreen({super.key});

  @override
  State<ReadingSessionScreen> createState() => _ReadingSessionScreenState();
}

class _ReadingSessionScreenState extends State<ReadingSessionScreen>
    with TickerProviderStateMixin {
  final FlutterTts flutterTts = FlutterTts();
  late AnimationController _fadeController;
  late AnimationController _contentFadeController;
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

    _fadeController.forward().then((_) {
      if (mounted) _contentFadeController.forward();
    });

    _initTts();
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.40);

    flutterTts.setStartHandler(() {
      if (mounted) setState(() => _isSpeaking = true);
    });

    flutterTts.setCompletionHandler(() {
      if (mounted) setState(() => _isSpeaking = false);
    });
  }

  @override
  void dispose() {
    flutterTts.stop();
    _fadeController.dispose();
    _contentFadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PlanSession session = Get.arguments['session'] as PlanSession;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Header Image (Background)
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
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.1),
                      Colors.white.withOpacity(0.5),
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                _buildHeader(session),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        SizedBox(height: 100.h),
                        FadeTransition(
                          opacity: _fadeController,
                          child: _buildTitleSection(session),
                        ),
                        SizedBox(height: 40.h),
                        FadeTransition(
                          opacity: _contentFadeController,
                          child: _buildContentCard(session),
                        ),
                        SizedBox(height: 48.h),
                        WwPrimaryButton(
                          text: 'Mark as Completed',
                          onPressed: () {
                            flutterTts.stop();
                            Get.back(
                              result: true,
                            ); // Return true to signal completion
                          },
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

  Widget _buildHeader(PlanSession session) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
                flutterTts.speak(
                  session.description + ". " + session.scripture,
                );
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    _isSpeaking ? Icons.volume_up : Icons.volume_off_outlined,
                    size: 18.w,
                    color: _isSpeaking ? Colors.blue : Colors.black,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    _isSpeaking ? 'Listening...' : 'Read Aloud',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleSection(PlanSession session) {
    return Column(
      children: [
        Text(
          session.dayName.toUpperCase(),
          style: TextStyle(
            letterSpacing: 1.5,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF64748B),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          session.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF0F172A),
          ),
        ),
      ],
    );
  }

  Widget _buildContentCard(PlanSession session) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            children: [
              Text(
                session.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  height: 1.5,
                  color: const Color(0xFF334155),
                ),
              ),
              SizedBox(height: 32.h),
              const Divider(),
              SizedBox(height: 32.h),
              Text(
                session.scripture,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  height: 1.5,
                  fontStyle: FontStyle.italic,
                  color: const Color(0xFF475569),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          session.reflection,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
  }
}
