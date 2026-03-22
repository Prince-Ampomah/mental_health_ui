import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';
import 'package:mental_health_ui/core/utils/extension.dart';
import 'package:mental_health_ui/features/assistant/models/doctor_model.dart';

class DoctorCalendarSection extends StatefulWidget {
  final DoctorModel doctor;

  const DoctorCalendarSection({super.key, required this.doctor});

  @override
  State<DoctorCalendarSection> createState() => _DoctorCalendarSectionState();
}

class _DoctorCalendarSectionState extends State<DoctorCalendarSection> {
  final List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  late int _currentMonthIndex;
  String? _selectedDay;

  @override
  void initState() {
    super.initState();
    _currentMonthIndex = DateTime.now().month - 1;
    // Default select first available day
    if (widget.doctor.availableDays.isNotEmpty) {
      _selectedDay = widget.doctor.availableDays.first;
    }
  }

  void _previousMonth() {
    if (_currentMonthIndex > 0) {
      setState(() => _currentMonthIndex--);
    }
  }

  void _nextMonth() {
    if (_currentMonthIndex < _months.length - 1) {
      setState(() => _currentMonthIndex++);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Month navigator ──
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              border: Border.all(width: .5, color: Colors.grey),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous arrow
                GestureDetector(
                  onTap: _previousMonth,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: _currentMonthIndex > 0
                          ? Colors.black87
                          : Colors.grey.shade300,
                    ),
                  ),
                ),

                // Current month pill
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: widget.doctor.headerColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      _months[_currentMonthIndex],
                      textAlign: .center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                // Next arrow
                GestureDetector(
                  onTap: _nextMonth,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: _currentMonthIndex < _months.length - 1
                          ? Colors.black87
                          : Colors.grey.shade300,
                    ),
                  ),
                ),
              ],
            ),
          ),

          40.ph,

          // ── "Available this week" label ──
          Text(
            'Available this week',
            style: AppTextStyles.headline3.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          12.ph,

          // ── Available day chips ──
          SizedBox(
            height: 44,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.doctor.availableDays.length,
              itemBuilder: (context, index) {
                final day = widget.doctor.availableDays[index];
                final isSelected = _selectedDay == day;

                return GestureDetector(
                  onTap: () => setState(() => _selectedDay = day),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF1F5F63)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(12),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      day,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
