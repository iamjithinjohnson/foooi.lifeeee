import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/bible_ai_controller.dart';

class ChatBubble extends StatelessWidget {
  final Message message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    if (message.type == 'verse') {
      return _buildVerseCard();
    }

    final isAiPart = [
      'encouragement',
      'prayer',
      'action',
    ].contains(message.type);

    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: message.isUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          if (!message.isUser) _buildAiHeader(),
          Row(
            mainAxisAlignment: message.isUser
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (message.isUser) _buildTime(message.time),
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: message.isUser
                        ? Colors.white
                        : (isAiPart
                              ? const Color(0xFFFFF9E1)
                              : const Color(0xFFFFEFA7)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                      bottomLeft: message.isUser
                          ? Radius.circular(20.r)
                          : Radius.zero,
                      bottomRight: message.isUser
                          ? Radius.zero
                          : Radius.circular(20.r),
                    ),
                    border: isAiPart
                        ? Border.all(color: const Color(0xFFFFD54F), width: 1.w)
                        : null,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xFF3F2109),
                      height: 1.4,
                    ),
                  ),
                ),
              ),
              if (!message.isUser) _buildTime(message.time),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAiHeader() {
    IconData? icon;
    String label = 'BIBLE AI';

    switch (message.type) {
      case 'encouragement':
        icon = Icons.favorite_rounded;
        label = 'A MESSAGE FOR YOU';
        break;
      case 'prayer':
        icon = Icons.auto_awesome_rounded;
        label = 'PRAYER';
        break;
      case 'action':
        icon = Icons.checklist_rounded;
        label = 'PRACTICAL ACTION';
        break;
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12.sp, color: Colors.orange),
            SizedBox(width: 4.w),
          ] else
            CircleAvatar(radius: 8.r, backgroundColor: Colors.orange),
          SizedBox(width: 8.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black45,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTime(String time) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Text(
        time,
        style: TextStyle(
          fontSize: 10.sp,
          color: Colors.black26,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget _buildVerseCard() {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAiHeader(),
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFEFA7), Color(0xFFFFD54F)],
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.text,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF3F2109),
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  message.reference ?? '',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF3F2109),
                    letterSpacing: 1.2,
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
