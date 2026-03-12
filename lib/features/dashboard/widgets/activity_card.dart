import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';
import 'package:mental_health_ui/core/utils/extension.dart';

import 'package:mental_health_ui/features/dashboard/model/activity_model.dart';

class ActivityCard extends StatelessWidget {
  final ActivityModel activity;

  const ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.38,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: activity.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            activity.title,
            style: AppTextStyles.headline3.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),

          8.ph,

          Row(
            children: [
              const Icon(Icons.schedule, size: 16),
              4.pw,
              Text(activity.duration, style: AppTextStyles.bodySmall),
            ],
          ),

          const Spacer(),

          Align(
            alignment: Alignment.bottomRight,
            child: Icon(activity.icon, size: 50),
          ),
        ],
      ),
    );
  }
}
