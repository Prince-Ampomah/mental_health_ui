import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';
import 'package:mental_health_ui/core/utils/extension.dart';

class PerformanceHeaderSection extends StatelessWidget {
  final int selectedTab; // 0 = Activity, 1 = Rankings
  final ValueChanged<int> onTabChanged;

  const PerformanceHeaderSection({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + bell row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mind Performance',
                    style: AppTextStyles.headline2.copyWith(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'Tracker',
                    style: AppTextStyles.headline2.copyWith(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(Icons.notifications_outlined, size: 26),
              ),
            ],
          ),

          24.ph,

          // Activity / Rankings tab switcher
          Row(
            children: [
              _TabItem(
                label: 'Activity',
                isSelected: selectedTab == 0,
                onTap: () => onTabChanged(0),
              ),
              32.pw,
              _TabItem(
                label: 'Rankings',
                isSelected: selectedTab == 1,
                onTap: () => onTabChanged(1),
              ),
            ],
          ),

          // Full-width divider under tabs
          Container(
            height: 1,
            color: Colors.grey.shade200,
            margin: const EdgeInsets.only(top: 0),
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? const Color(0xFF1F5F63) : Colors.grey,
              ),
            ),
          ),
          // Active underline indicator
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 2,
            width: isSelected ? 60 : 0,
            decoration: BoxDecoration(
              color: const Color(0xFF1F5F63),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
