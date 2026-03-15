import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/utils/extension.dart';
import 'package:mental_health_ui/features/dashboard/sections/consistency_score_section.dart';
import 'package:mental_health_ui/features/dashboard/sections/date_selector_section.dart';
import 'package:mental_health_ui/features/dashboard/sections/favorite_activity_section.dart';
import 'package:mental_health_ui/features/dashboard/sections/trending_section.dart';
import 'package:mental_health_ui/features/dashboard/sections/greeting_and_notification.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            GreetingAndNotificationSection(),

            20.ph,

            DateSelectorSection(),

            20.ph,

            ConsistencyScoreSection(),

            30.ph,

            FavoriteActivitySection(),

            15.ph,

            TrendingSection(),
          ],
        ),
      ),
    );
  }
}
