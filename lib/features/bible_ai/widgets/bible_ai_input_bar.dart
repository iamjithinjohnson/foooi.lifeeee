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
              color: Colors.black.withOpacity(0.05),
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
                _buildIconButton(Icons.add),
                SizedBox(width: 8.w),
                _buildIconButton(Icons.tune),
                const Spacer(),
                _buildModelSelector(),
                SizedBox(width: 12.w),
                Obx(() => GestureDetector(
                  onTap: () => controller.sendMessage(controller.textController.text),
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: controller.isTextEmpty.value 
                          ? Colors.orange.withOpacity(0.5) 
                          : Colors.orange,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: const Icon(Icons.arrow_upward, color: Colors.white),
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Icon(icon, color: Colors.black54, size: 20.w),
    );
  }

  Widget _buildModelSelector() {
    return InkWell(
      onTap: () {}, // Handle model selection
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() => Text(
            controller.selectedModel.value,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          )),
          const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
        ],
      ),
    );
  }
}
