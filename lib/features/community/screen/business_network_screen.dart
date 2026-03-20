import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BusinessNetworkScreen extends StatefulWidget {
  const BusinessNetworkScreen({super.key});

  @override
  State<BusinessNetworkScreen> createState() => _BusinessNetworkScreenState();
}

class _BusinessNetworkScreenState extends State<BusinessNetworkScreen> {
  final List<String> categories = ['All', 'Automotive', 'Finance', 'Food & Beverage', 'Construction', 'Technology', 'Education'];
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
          'Business Network',
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
          children: [
            _buildSearchBar(),
            SizedBox(height: 20.h),
            _buildCategoriesSection(),
            SizedBox(height: 24.h),
            _buildBusinessCard(
              name: 'Grace Auto Repairs',
              category: 'Automotive',
              location: 'Houston, TX',
              tagline: 'Trusted auto repair and maintenance services by a faith-driven team. Honest pricing and quality work.',
              services: ['Oil Change', 'Brake Repair', 'Engine Diagnostics', 'Tire Services'],
              email: 'grace.auto@email.com',
              phone: '+1 555-0101',
              church: 'Grace Community Church',
              isVerified: true,
            ),
            SizedBox(height: 16.h),
            _buildBusinessCardMinimal(name: 'Faithful Accounting', category: 'Finance', location: 'Dallas, TX', isVerified: true),
            SizedBox(height: 16.h),
            _buildBusinessCardMinimal(name: 'Blessed Bakery', category: 'Food & Beverage', location: 'Austin, TX'),
            SizedBox(height: 16.h),
            _buildBusinessCardMinimal(name: 'Covenant Construction', category: 'Construction', location: 'San Antonio, TX', isVerified: true),
            SizedBox(height: 16.h),
            _buildBusinessCardMinimal(name: 'Shepherd IT Solutions', category: 'Technology', location: 'Pheonix, AZ', isVerified: true),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: const Color(0xFF94A3B8), size: 20.w),
          hintText: 'Search businesses...',
          hintStyle: TextStyle(color: const Color(0xFF94A3B8), fontSize: 14.sp),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
        ),
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

  Widget _buildBusinessCard({
    required String name,
    required String category,
    required String location,
    required String tagline,
    required List<String> services,
    required String email,
    required String phone,
    required String church,
    bool isVerified = false,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Container(
                  width: 44.w,
                  height: 44.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(Icons.business_outlined, color: const Color(0xFF94A3B8), size: 24.w),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1E293B),
                            ),
                          ),
                          if (isVerified) ...[
                            SizedBox(width: 4.w),
                            Icon(Icons.verified, size: 14.w, color: Colors.blue),
                          ],
                        ],
                      ),
                      Text(
                        category,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFF94A3B8),
                        ),
                      ),
                      Text(
                        '📍 $location',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: const Color(0xFF94A3B8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tagline,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: const Color(0xFF1E293B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 6.w,
                  runSpacing: 6.h,
                  children: services.map((service) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      service,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                  )).toList(),
                ),
                SizedBox(height: 16.h),
                _buildContactInfo(Icons.email_outlined, email),
                SizedBox(height: 8.h),
                _buildContactInfo(Icons.phone_outlined, phone),
                SizedBox(height: 8.h),
                _buildContactInfo(Icons.castle_outlined, church),
                SizedBox(height: 20.h),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B82F6),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
                ),
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 16.h),
              ),
              child: Text(
                'Connect',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBusinessCardMinimal({
    required String name,
    required String category,
    required String location,
    bool isVerified = false,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.business_outlined, color: const Color(0xFF94A3B8), size: 24.w),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E293B),
                      ),
                    ),
                    if (isVerified) ...[
                      SizedBox(width: 4.w),
                      Icon(Icons.verified, size: 14.w, color: Colors.blue),
                    ],
                  ],
                ),
                Text(
                  category,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFF94A3B8),
                  ),
                ),
                Text(
                   '📍 $location',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: const Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16.w, color: const Color(0xFF64748B)),
        SizedBox(width: 8.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            color: const Color(0xFF64748B),
          ),
        ),
      ],
    );
  }
}
