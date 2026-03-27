import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/features/bible_ai/widgets/bible_ai_input_bar.dart';
import 'package:foi/features/bible_ai/widgets/chat_bubble.dart';
import 'package:foi/features/bible_ai/widgets/suggestion_card.dart';
import 'package:get/get.dart';
import '../controller/bible_ai_controller.dart';

class BibleAiScreen extends GetView<BibleAiController> {
  const BibleAiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE3F2FD), Colors.white, Color(0xFFF3E5F5)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: Obx(
                  () {
                    final messages = controller.messages;
                    return messages.isEmpty
                        ? _buildEmptyState()
                        : _buildChatList(messages);
                  },
                ),
              ),
              const BibleAiInputBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back),
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            'Bible AI',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 60.h),
          Text(
            'Bible AI',
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF3F2109),
              fontFamily: 'PP Cirka',
            ),
          ),
          SizedBox(height: 48.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 1.0,
              ),
              itemCount: controller.suggestionTexts.length,
              itemBuilder: (context, index) {
                return SuggestionCard(
                  text: controller.suggestionTexts[index],
                  onTap: () =>
                      controller.sendMessage(controller.suggestionTexts[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatList(List<Message> messages) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Text(
            'TODAY • 24RD DEC, 2025',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return ChatBubble(message: message);
            },
          ),
        ),
      ],
    );
  }
}
