import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/grow_controller.dart';

class RoutineDetailsScreen extends StatefulWidget {
  const RoutineDetailsScreen({super.key});

  @override
  State<RoutineDetailsScreen> createState() => _RoutineDetailsScreenState();
}

class _RoutineDetailsScreenState extends State<RoutineDetailsScreen> {
  final GrowController controller = Get.find<GrowController>();
  late Map<String, dynamic> routineArgs;
  
  int _currentStepIndex = -1; // -1 means not started
  int _remainingSeconds = 0;
  Timer? _timer;
  final List<bool> _stepCompletion = [];
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    routineArgs = Get.arguments;
    final List steps = routineArgs['steps'] ?? [];
    for (int i = 0; i < steps.length; i++) {
      _stepCompletion.add(false);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startRoutine() {
    if (_stepCompletion.every((element) => element)) {
      // If all completed, reset for restart?
      setState(() {
        for (int i = 0; i < _stepCompletion.length; i++) {
          _stepCompletion[i] = false;
        }
      });
    }
    _nextStep();
  }

  void _nextStep() {
    _timer?.cancel();
    _isPaused = false;
    
    // Find next uncompleted step
    int nextIndex = -1;
    for (int i = 0; i < _stepCompletion.length; i++) {
      if (!_stepCompletion[i]) {
        nextIndex = i;
        break;
      }
    }

    if (nextIndex != -1) {
      final List steps = routineArgs['steps'];
      final step = steps[nextIndex];
      // If step is StepModel, get durationMinutes, else default 1
      final int durationMins = (step is StepModel) ? step.durationMinutes : 1;
      
      setState(() {
        _currentStepIndex = nextIndex;
        _remainingSeconds = durationMins * 60;
      });

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!_isPaused) {
          if (_remainingSeconds > 0) {
            setState(() {
              _remainingSeconds--;
            });
          } else {
            _completeCurrentStep();
          }
        }
      });
    } else {
      _finishRoutine();
    }
  }

  void _completeCurrentStep() {
    _timer?.cancel();
    _isPaused = false;
    setState(() {
      if (_currentStepIndex != -1) {
        _stepCompletion[_currentStepIndex] = true;
      }
      _currentStepIndex = -1;
    });
    
    // Check if more steps left, else finish
    if (_stepCompletion.contains(false)) {
      _nextStep();
    } else {
      _finishRoutine();
    }
  }

  void _finishRoutine() {
    setState(() {
      _currentStepIndex = -1;
    });
    
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
        child: Padding(
          padding: EdgeInsets.all(32.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), shape: BoxShape.circle),
                child: Icon(Icons.celebration, color: Colors.green, size: 48.w),
              ),
              SizedBox(height: 24.h),
              Text('Routine Completed!', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B))),
              SizedBox(height: 12.h),
              Text(
                'Great job! You\'ve completed all steps and earned ${routineArgs['xp'] ?? '+10XP'}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, color: const Color(0xFF64748B)),
              ),
              SizedBox(height: 32.h),
              ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2B5AE1),
                  minimumSize: Size(double.infinity, 50.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                ),
                child: Text('Awesome!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(int seconds) {
    int mins = seconds ~/ 60;
    int secs = seconds % 60;
    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final String title = routineArgs['title'] ?? 'Routine';
    final String duration = routineArgs['duration'] ?? '0 min';
    final Color color = routineArgs['color'] ?? const Color(0xFF2B5AE1);
    final IconData icon = routineArgs['icon'] ?? Icons.star;
    final List steps = routineArgs['steps'] ?? [];
    final String category = routineArgs['category'] ?? 'General';
    final String streak = routineArgs['streak'] ?? '0 day streak';
    final String xp = routineArgs['xp'] ?? '+10XP';
    
    // Calculate progress based on completion
    double progressValue = 0.0;
    if (steps.isNotEmpty) {
      int completedCount = _stepCompletion.where((e) => e).length;
      progressValue = completedCount / steps.length;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (_timer?.isActive ?? false) {
              Get.dialog(
                AlertDialog(
                  title: Text('Exit Routine?'),
                  content: Text('Your progress for this session will be lost.'),
                  actions: [
                    TextButton(onPressed: () => Get.back(), child: Text('Continue')),
                    TextButton(onPressed: () { Get.back(); Get.back(); }, child: Text('Exit', style: TextStyle(color: Colors.red))),
                  ],
                ),
              );
            } else {
              Get.back();
            }
          },
        ),
        title: Text(
          'Routine Details',
          style: TextStyle(color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.w),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
                    child: Icon(icon, color: color, size: 40.w),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    title,
                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                  ),
                  Text(
                    '$duration • $category',
                    style: TextStyle(fontSize: 14.sp, color: const Color(0xFF64748B), fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),

            // Progress Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatItem('🔥 $streak', 'Streak'),
                        _buildStatItem('⭐ $xp', 'Reward'),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Progress', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B))),
                        Text('${(progressValue * 100).toInt()}%', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: color)),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: LinearProgressIndicator(
                        value: progressValue,
                        backgroundColor: color.withOpacity(0.1),
                        valueColor: AlwaysStoppedAnimation<Color>(color),
                        minHeight: 8.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 32.h),

            // Steps section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Routine Steps', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B))),
                  SizedBox(height: 16.h),
                  ...steps.asMap().entries.map((entry) {
                    final step = entry.value;
                    final String stepTitle = (step is StepModel) ? step.title : step.toString();
                    return _buildStepCard(
                      entry.key, 
                      stepTitle, 
                      _stepCompletion[entry.key],
                      isActive: _currentStepIndex == entry.key,
                    );
                  }),
                ],
              ),
            ),
            SizedBox(height: 120.h),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
        ),
        child: Row(
          children: [
            if (_timer?.isActive ?? false)
              Expanded(
                child: OutlinedButton(
                  onPressed: () => setState(() => _isPaused = !_isPaused),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    side: const BorderSide(color: Color(0xFFF1F5F9)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                  ),
                  child: Text(
                    _isPaused ? 'Resume' : 'Pause',
                    style: TextStyle(color: const Color(0xFF1E293B), fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            if (_timer?.isActive ?? false) SizedBox(width: 16.w),
            Expanded(
              flex: (_timer?.isActive ?? false) ? 2 : 1,
              child: ElevatedButton(
                onPressed: (_timer?.isActive ?? false) ? _completeCurrentStep : _startRoutine,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2B5AE1),
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                  elevation: 0,
                ),
                child: Text(
                  (_timer?.isActive ?? false) ? 'Skip Step' : (_stepCompletion.any((e) => e) ? 'Continue Routine' : 'Start Routine'),
                  style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String val, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(val, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B))),
        Text(label, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF64748B))),
      ],
    );
  }

  Widget _buildStepCard(int index, String title, bool isCompleted, {bool isActive = false}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isActive ? (isCompleted ? Colors.white : const Color(0xFF2B5AE1).withOpacity(0.05)) : Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: isActive ? const Color(0xFF2B5AE1) : const Color(0xFFF1F5F9)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(color: isCompleted ? Colors.green.withOpacity(0.1) : (isActive ? const Color(0xFF2B5AE1).withOpacity(0.1) : const Color(0xFFF1F5F9)), shape: BoxShape.circle),
            child: Icon(
              isCompleted ? Icons.check : (isActive ? (_isPaused ? Icons.pause_circle_outline : Icons.timer_outlined) : Icons.play_arrow_rounded), 
              color: isCompleted ? Colors.green : (isActive ? const Color(0xFF2B5AE1) : const Color(0xFF64748B)), 
              size: 16.w
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, color: const Color(0xFF1E293B)),
                ),
                if (isActive) 
                  Text(_isPaused ? 'Paused • ${_formatTime(_remainingSeconds)}' : 'Active • ${_formatTime(_remainingSeconds)}', style: TextStyle(fontSize: 12.sp, color: _isPaused ? Colors.orange : const Color(0xFF2B5AE1), fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          if (isCompleted) Icon(Icons.check_circle, color: Colors.green, size: 20.w),
        ],
      ),
    );
  }
}
