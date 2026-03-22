import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';

class PerformanceHeaderSection extends StatelessWidget {
  const PerformanceHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mind Performance\nTracker',
            style: AppTextStyles.headline2.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
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
    );
  }
}
