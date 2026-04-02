import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/grow_controller.dart';

class CreateCustomRoutineScreen extends StatefulWidget {
  const CreateCustomRoutineScreen({super.key});

  @override
  State<CreateCustomRoutineScreen> createState() =>
      _CreateCustomRoutineScreenState();
}

class _CreateCustomRoutineScreenState extends State<CreateCustomRoutineScreen> {
  final GrowController controller = Get.find<GrowController>();
  final TextEditingController _nameController = TextEditingController();
  String _selectedCategory = 'Health';
  String _selectedFrequency = 'Daily';
  DateTime? _startDate;
  DateTime? _endDate;
  TimeOfDay? _startTime;
  final List<Map<String, dynamic>> _steps = [];
  bool _isFromTemplate = false;

  @override
  void initState() {
    super.initState();
    if (Get.arguments != null && Get.arguments is Map) {
      _isFromTemplate = true;
      final args = Get.arguments as Map<String, dynamic>;
      _nameController.text = args['title'] ?? '';
      _selectedCategory = args['category'] ?? 'Health';
      if (args['steps'] != null && args['steps'] is List) {
        for (var step in args['steps']) {
          // Templates might have strings as steps, or maps
          if (step is String) {
            // Split "Name (X min)" if possible, or default to 1 min
            final match = RegExp(r'(.*)\((\d+)\s*min\)').firstMatch(step);
            if (match != null) {
              _steps.add({
                'title': match.group(1)?.trim() ?? step,
                'duration': int.tryParse(match.group(2) ?? '1') ?? 1,
              });
            } else {
              _steps.add({'title': step, 'duration': 1});
            }
          } else if (step is Map<String, dynamic>) {
            _steps.add({'title': step['title'], 'duration': step['duration']});
          }
        }
      }
    }
  }

  final List<String> _categories = [
    'Health',
    'Mind',
    'Faith',
    'Relationships',
    'Goals',
  ];
  final List<String> _frequencies = ['Daily', 'Weekly'];

  int get _totalDuration {
    int total = 0;
    for (var step in _steps) {
      total += (step['duration'] as int? ?? 0);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
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
          _isFromTemplate ? 'Update Routine' : 'Create Custom Routine',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel('Routine Name'),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'e.g., Morning Walk',
                  hintStyle: TextStyle(
                    color: const Color(0xFF94A3B8),
                    fontSize: 16.sp,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              _buildLabel('Category'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _categories
                      .map(
                        (cat) => _buildChip(
                          cat,
                          _selectedCategory,
                          (val) => setState(() => _selectedCategory = val),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Duration',
                            style: TextStyle(
                              color: const Color(0xFF64748B),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '$_totalDuration min',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF2B5AE1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Frequency',
                            style: TextStyle(
                              color: const Color(0xFF64748B),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: _frequencies
                                .map(
                                  (f) => Padding(
                                    padding: EdgeInsets.only(right: 8.w),
                                    child: GestureDetector(
                                      onTap: () => setState(
                                        () => _selectedFrequency = f,
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8.w,
                                          vertical: 4.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: _selectedFrequency == f
                                              ? const Color(0xFF2B5AE1)
                                              : Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            8.r,
                                          ),
                                          border: Border.all(
                                            color: _selectedFrequency == f
                                                ? const Color(0xFF2B5AE1)
                                                : const Color(0xFFE2E8F0),
                                          ),
                                        ),
                                        child: Text(
                                          f,
                                          style: TextStyle(
                                            color: _selectedFrequency == f
                                                ? Colors.white
                                                : const Color(0xFF64748B),
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('Start Time'),
                        GestureDetector(
                          onTap: () => _selectTime(context),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8FAFC),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 18.w,
                                  color: const Color(0xFF64748B),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  _startTime == null
                                      ? 'Select'
                                      : _startTime!.format(context),
                                  style: TextStyle(
                                    color: _startTime == null
                                        ? const Color(0xFF94A3B8)
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildLabel('Start Date'),
                            if (_startDate != null)
                              GestureDetector(
                                onTap: () => setState(() => _startDate = null),
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 8.h),
                                  child: Text(
                                    'Clear',
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => _selectDate(context, true),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8FAFC),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 18.w,
                                  color: const Color(0xFF64748B),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  _startDate == null
                                      ? 'Select'
                                      : _startDate!.toString().split(' ')[0],
                                  style: TextStyle(
                                    color: _startDate == null
                                        ? const Color(0xFF94A3B8)
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildLabel('End Date'),
                            if (_endDate != null)
                              GestureDetector(
                                onTap: () => setState(() => _endDate = null),
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 8.h),
                                  child: Text(
                                    'Clear',
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => _selectDate(context, false),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8FAFC),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 18.w,
                                  color: const Color(0xFF64748B),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  _endDate == null
                                      ? 'Select'
                                      : _endDate!.toString().split(' ')[0],
                                  style: TextStyle(
                                    color: _endDate == null
                                        ? const Color(0xFF94A3B8)
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (_startDate != null && _endDate != null) ...[
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF7ED),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: Color(0xFFC05621),
                        size: 18,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Plan Duration: ${_endDate!.difference(_startDate!).inDays} days',
                        style: const TextStyle(
                          color: Color(0xFFC05621),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLabel('Steps'),
                  TextButton.icon(
                    onPressed: _showAddStepBottomSheet,
                    icon: const Icon(
                      Icons.add_circle_outline,
                      size: 20,
                      color: Color(0xFF2B5AE1),
                    ),
                    label: Text(
                      'Add Step',
                      style: TextStyle(
                        color: const Color(0xFF2B5AE1),
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
              _steps.isEmpty
                  ? _buildEmptySteps()
                  : Column(
                      children: _steps
                          .asMap()
                          .entries
                          .map(
                            (entry) => _buildStepItem(entry.key, entry.value),
                          )
                          .toList(),
                    ),
              SizedBox(height: 48.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: ElevatedButton(
            onPressed: _saveRoutine,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2B5AE1),
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              elevation: 0,
            ),
            child: Text(
              'Save Routine',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF1E293B),
        ),
      ),
    );
  }

  Widget _buildChip(
    String label,
    String selected,
    Function(String) onSelected,
  ) {
    final isSelected = selected == label;
    return GestureDetector(
      onTap: () => onSelected(label),
      child: Container(
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2B5AE1) : const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF64748B),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildEmptySteps() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          style: BorderStyle.none,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.format_list_bulleted,
            color: const Color(0xFFCBD5E1),
            size: 40.w,
          ),
          SizedBox(height: 12.h),
          Text(
            'No steps added yet',
            style: TextStyle(color: const Color(0xFF64748B), fontSize: 14.sp),
          ),
          Text(
            'Add some steps to build your routine',
            style: TextStyle(color: const Color(0xFF94A3B8), fontSize: 12.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem(int index, Map<String, dynamic> step) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              shape: BoxShape.circle,
            ),
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF2B5AE1),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
                Text(
                  '${step['duration']} min',
                  style: TextStyle(
                    color: const Color(0xFF64748B),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.remove_circle_outline,
              color: Colors.redAccent,
              size: 20,
            ),
            onPressed: () => setState(() => _steps.removeAt(index)),
          ),
        ],
      ),
    );
  }

  void _showAddStepBottomSheet() {
    FocusScope.of(context).unfocus();
    String stepTitle = '';
    int stepDuration = 0;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Routine Step',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24.h),
              _buildLabel('Step Instruction'),
              TextField(
                onChanged: (val) => stepTitle = val,
                decoration: InputDecoration(
                  hintText: 'e.g., Breathe deep',
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              _buildLabel('Step Duration'),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  final numeric = val.replaceAll(RegExp(r'[^0-9]'), '');
                  stepDuration = int.tryParse(numeric) ?? 0;
                },
                decoration: InputDecoration(
                  hintText: 'e.g., 2',
                  suffixText: 'min',
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (stepTitle.trim().isEmpty) {
                    Get.snackbar(
                      'Instruction missing',
                      'Please describe what you want to do in this step',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                    return;
                  }
                  if (stepDuration <= 0) {
                    Get.snackbar(
                      'Invalid Duration',
                      'Please enter a valid duration in minutes',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                    return;
                  }

                  setState(() {
                    _steps.add({'title': stepTitle, 'duration': stepDuration});
                  });
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2B5AE1),
                  minimumSize: Size(double.infinity, 54.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: const Text(
                  'Add to Routine',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF2B5AE1),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
          if (_endDate != null && _endDate!.isBefore(_startDate!)) {
            _endDate = null;
          }
        } else {
          if (_startDate != null && picked.isBefore(_startDate!)) {
            Get.snackbar(
              'Invalid Date',
              'End date cannot be before start date',
            );
          } else {
            _endDate = picked;
          }
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF2B5AE1),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() => _startTime = picked);
    }
  }

  void _saveRoutine() {
    try {
      // 1. Validation
      final String name = _nameController.text.trim();
      if (name.isEmpty) {
        Get.snackbar(
          'Field Required',
          'Please enter a name for your routine',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
        return;
      }

      if (_steps.isEmpty) {
        Get.snackbar(
          'Empty Steps',
          'Please add at least one step to your routine',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
        return;
      }

      if (_startTime == null) {
        Get.snackbar(
          'Time Required',
          'Please select a start time for your routine',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
        return;
      }

      // Default dates if missing
      final effectiveStartDate = _startDate ?? DateTime.now();
      final effectiveEndDate = _endDate;

      if (effectiveEndDate != null &&
          effectiveEndDate.isBefore(effectiveStartDate)) {
        Get.snackbar(
          'Invalid Dates',
          'End date must be after start date',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
        return;
      }

      // 2. Logic & Mapping
      final int xp = (_steps.length * 3) + (_steps.length >= 3 ? 1 : 0);

      final routine = RoutineModel(
        title: name,
        duration: '$_totalDuration min',
        progress: 0.0,
        xp: '+$xp XP',
        streak: '0 day streak',
        color: _getCategoryColor(_selectedCategory),
        icon: _getCategoryIcon(_selectedCategory),
        category: _selectedCategory,
        steps: _steps
            .map((e) => StepModel(
                  title: e['title'] as String,
                  durationMinutes: e['duration'] as int,
                ))
            .toList(),
      );

      // 3. Execution
      controller.addRoutine(routine);

      // 4. Navigation
      // We use a small delay if needed or simple back
      Get.back();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    }
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
