import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/grow_controller.dart';
import '../../../utils/routes/app_routes.dart';

class TemplateSelectionScreen extends GetView<GrowController> {
  const TemplateSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, dynamic>>> templates = {
      'Health': [
        {
          'title': 'Morning Workout',
          'duration': '5 min',
          'icon': Icons.fitness_center,
          'color': Colors.blue,
          'steps': ['Stretch (1 min)', 'Exercise (3 min)', 'Breathe (1 min)'],
          'xp': '+10XP',
        },
        {
          'title': 'Stretch Routine',
          'duration': '3 min',
          'icon': Icons.accessibility_new,
          'color': Colors.blue,
          'steps': ['Neck side stretches', 'Shoulder rolls', 'Forward fold'],
          'xp': '+5XP',
        },
      ],
      'Faith': [
        {
          'title': 'Prayer Time',
          'duration': '10 min',
          'icon': Icons.auto_stories,
          'color': Colors.orange,
          'steps': [
            'Silent Prayer (3 min)',
            'Bible Reading (5 min)',
            'Journaling (2 min)',
          ],
          'xp': '+15XP',
        },
        {
          'title': 'Read Scripture',
          'duration': '5 min',
          'icon': Icons.menu_book,
          'color': Colors.green,
          'steps': ['Select Chapter', 'Read slowly', 'Reflect'],
          'xp': '+10XP',
        },
      ],
      'Relationships': [
        {
          'title': 'Call Family',
          'duration': 'Daily',
          'icon': Icons.family_restroom,
          'color': Colors.red,
          'steps': [
            'Pick a relative',
            'Call or Voice note',
            'Share a blessing',
          ],
          'xp': '+20XP',
        },
        {
          'title': 'Talk to a Friend',
          'duration': 'Weekly',
          'icon': Icons.chat_bubble_outline,
          'color': Colors.red,
          'steps': ['Choose a friend', 'Hear them out', 'Pray together'],
          'xp': '+15XP',
        },
      ],
      'Mind': [
        {
          'title': 'Meditation',
          'duration': '5 min',
          'icon': Icons.self_improvement,
          'color': Colors.purple,
          'steps': ['Find quiet space', 'Focus on breath', 'Observe thoughts'],
          'xp': '+10XP',
        },
        {
          'title': 'Gratitude Practice',
          'duration': '3 min',
          'icon': Icons.favorite_border,
          'color': Colors.purple,
          'steps': ['Think of 3 things', 'Write them down', 'Say thank you'],
          'xp': '+5XP',
        },
      ],
    };

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Choose a Routine',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: templates.entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 16.h),
                  child: Row(
                    children: [
                      Icon(
                        _getCategoryIcon(entry.key),
                        size: 20.w,
                        color: _getCategoryColor(entry.key),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        entry.key,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1E293B),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: entry.value.length,
                  itemBuilder: (context, index) {
                    final template = entry.value[index];
                    return _buildTemplateItem(context, template, entry.key);
                  },
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTemplateItem(
    BuildContext context,
    Map<String, dynamic> template,
    String category,
  ) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        Routes.CREATE_CUSTOM_ROUTINE,
        arguments: {...template, 'category': category},
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFFF1F5F9)),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: (template['color'] as Color).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                template['icon'] as IconData,
                color: template['color'] as Color,
                size: 20.w,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    template['title'] as String,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    template['duration'] as String,
                    style: TextStyle(
                      color: const Color(0xFF64748B),
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: const Color(0xFFCBD5E1),
              size: 20.w,
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Health':
        return Icons.fitness_center;
      case 'Mind':
        return Icons.psychology;
      case 'Faith':
        return Icons.auto_stories;
      case 'Relationships':
        return Icons.favorite;
      case 'Goals':
        return Icons.track_changes;
      default:
        return Icons.star;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Health':
        return Colors.blue;
      case 'Mind':
        return Colors.purple;
      case 'Faith':
        return Colors.orange;
      case 'Relationships':
        return Colors.red;
      case 'Goals':
        return Colors.green;
      default:
        return Colors.blue;
    }
  }
}
