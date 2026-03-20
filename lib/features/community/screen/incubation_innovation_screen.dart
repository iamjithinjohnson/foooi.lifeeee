import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IncubationInnovationScreen extends StatefulWidget {
  const IncubationInnovationScreen({super.key});

  @override
  State<IncubationInnovationScreen> createState() => _IncubationInnovationScreenState();
}

class _IncubationInnovationScreenState extends State<IncubationInnovationScreen> {
  final List<String> categories = ['All', 'Education', 'Food & Agriculture', 'Technology', 'Healthcare'];
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.w),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Incubation & Innovation',
          style: TextStyle(
            color: const Color(0xFF0F172A),
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Submit ideas, get funded',
              style: TextStyle(
                color: const Color(0xFF64748B),
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 16.h),
            _buildSubmitIdeaBanner(),
            SizedBox(height: 20.h),
            _buildCategoriesSection(),
            SizedBox(height: 20.h),
            _buildStartupCard(
              title: 'FaithTech Academy',
              author: 'Emmanuel Okafor',
              description: 'An online platform providing affordable tech training to youth from underserved Christian communities.',
              amount: '\$25,000',
              status: 'Funded',
              church: 'Grace Community Church',
              statusColor: Colors.blue,
            ),
            SizedBox(height: 16.h),
            _buildStartupCard(
              title: 'Harvest Box',
              author: 'Maria Garcia',
              description: 'A subscription service delivering fresh produce from local Christian farms directly to families.',
              amount: '\$15,000',
              status: 'Approved',
              church: 'St. Mary\'s Cathedral',
              statusColor: Colors.orange,
            ),
            SizedBox(height: 16.h),
            _buildStartupCard(
              title: 'PrayerLink',
              author: 'David Chen',
              description: 'A mobile app connecting prayer partners across different congregations for daily prayer commitments.',
              amount: '\$10,000',
              status: 'Under Review',
              church: 'New Life Church',
              statusColor: Colors.amber,
            ),
            SizedBox(height: 16.h),
            _buildStartupCard(
              title: 'Agape Senior Care',
              author: 'Ruth Anderson',
              description: 'Home care services for elderly church members, provided by trained caregivers from the congregation.',
              amount: '\$30,000',
              status: 'Submitted',
              church: 'First Baptist Church',
              statusColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitIdeaBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFFFEDD5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.lightbulb_outline, color: Colors.orange, size: 18.w),
          SizedBox(width: 8.w),
          Text(
            'Submit a Startup Idea',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF9A3412),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          bool isSelected = selectedCategoryIndex == index;
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: GestureDetector(
              onTap: () => setState(() => selectedCategoryIndex = index),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF13768E) : Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: isSelected ? const Color(0xFF13768E) : const Color(0xFFE2E8F0)),
                ),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: isSelected ? Colors.white : const Color(0xFF64748B),
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildStartupCard({
    required String title,
    required String author,
    required String description,
    required String amount,
    required String status,
    required String church,
    required Color statusColor,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      'by $author',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                     Icon(Icons.check_circle, size: 12.w, color: statusColor),
                     SizedBox(width: 4.w),
                     Text(
                      status,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            description,
            style: TextStyle(
              fontSize: 13.sp,
              color: const Color(0xFF64748B),
              height: 1.4,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.monetization_on_outlined, size: 16.w, color: Colors.amber),
                  SizedBox(width: 4.w),
                  Text(
                    amount,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.castle_outlined, size: 16.w, color: const Color(0xFF64748B)),
                  SizedBox(width: 4.w),
                  Text(
                    church,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
