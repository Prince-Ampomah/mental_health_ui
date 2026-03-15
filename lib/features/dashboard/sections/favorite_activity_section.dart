import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';
import 'package:mental_health_ui/core/utils/extension.dart';
import 'package:mental_health_ui/features/dashboard/model/activity_model.dart';
import 'package:mental_health_ui/features/dashboard/widgets/activity_card.dart';

class FavoriteActivitySection extends StatelessWidget {
  const FavoriteActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'Favorite activities',
            style: AppTextStyles.headline3.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        15.ph,

        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 140),
          child: SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: activities.length,
              itemBuilder: (context, index) {
                return ActivityCard(activity: activities[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
