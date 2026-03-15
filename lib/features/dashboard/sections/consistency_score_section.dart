import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';
import 'package:mental_health_ui/core/utils/extension.dart';
import 'package:mental_health_ui/features/dashboard/model/chart_model.dart';
import 'package:mental_health_ui/features/dashboard/widgets/consistency_chart.dart';

class ConsistencyScoreSection extends StatelessWidget {
  const ConsistencyScoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          'Consistency score',
          style: AppTextStyles.headline2.copyWith(
            color: context.color.onPrimaryContainer,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),

        10.ph,

        Stack(
          children: [
            ConsistencyChart(data: consistencyData),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Avg 12.3%",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
