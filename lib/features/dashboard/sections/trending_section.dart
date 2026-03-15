import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';
import 'package:mental_health_ui/core/utils/extension.dart';
import 'package:mental_health_ui/features/dashboard/model/trending_activity_model.dart';
import 'package:mental_health_ui/features/dashboard/widgets/trending_card.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          'Trending',
          style: AppTextStyles.headline3.copyWith(fontWeight: FontWeight.bold),
        ),
        15.ph,

        TrendingCard(activity: trendingActivities[0]),
      ],
    );
  }
}
