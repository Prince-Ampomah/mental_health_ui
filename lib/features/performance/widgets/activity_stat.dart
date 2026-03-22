import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';
import 'package:mental_health_ui/core/utils/extension.dart';
import 'package:mental_health_ui/features/performance/models/performance_model.dart';

class ActivityStat extends StatelessWidget {
  final ActivityStatModel stat;

  const ActivityStat({super.key, required this.stat});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(stat.icon, color: stat.iconColor, size: 26),
        10.pw,
        Column(
          children: [
            Text(
              stat.label,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            ),
            4.ph,
            Text(
              stat.value,
              style: AppTextStyles.body.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
