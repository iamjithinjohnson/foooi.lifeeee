import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/bible_ai_controller.dart';

class BibleAiInputBar extends GetView<BibleAiController> {
  const BibleAiInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller.textController,
              decoration: InputDecoration(
                hintText: 'hi, could you tell me more about you?',
                hintStyle: TextStyle(color: Colors.black38, fontSize: 16.sp),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
              ),
              maxLines: null,
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Obx(() => _buildMicButton()),
                const Spacer(),
                Obx(() => GestureDetector(
                  onTap: controller.isLoading.value 
                      ? null 
                      : () => controller.sendMessage(controller.textController.text),
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: (controller.isTextEmpty.value || controller.isLoading.value)
                          ? Colors.orange.withValues(alpha: 0.5) 
                          : Colors.orange,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: controller.isLoading.value
                        ? SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Icon(Icons.arrow_upward, color: Colors.white),
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMicButton() {
    final isListening = controller.isListening.value;
    return GestureDetector(
      onTapDown: (_) => controller.startListening(),
      onTapUp: (_) => controller.stopListening(),
      onTapCancel: () => controller.stopListening(),
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: isListening ? Colors.red.withValues(alpha: 0.1) : Colors.transparent,
          border: Border.all(color: isListening ? Colors.red : Colors.black12),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(
          isListening ? Icons.mic : Icons.mic_none, 
          color: isListening ? Colors.red : Colors.black54, 
          size: 20.w
        ),
      ),
    );
  }
}
