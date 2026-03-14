import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';
import 'package:mental_health_ui/core/utils/date_time_convertor.dart';
import 'package:mental_health_ui/core/utils/extension.dart';
import 'package:mental_health_ui/features/dashboard/model/activity_model.dart';
import 'package:mental_health_ui/features/dashboard/model/chart_model.dart';
import 'package:mental_health_ui/features/dashboard/model/trending_activity_model.dart';
import 'package:mental_health_ui/features/dashboard/widgets/activity_card.dart';
import 'package:mental_health_ui/features/dashboard/widgets/consistency_chart.dart';
import 'package:mental_health_ui/features/dashboard/widgets/date_selector.dart';
import 'package:mental_health_ui/features/dashboard/widgets/greeting_and_notification.dart';
import 'package:mental_health_ui/features/dashboard/widgets/trending_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      ActivityModel(
        title: "Mind\nDetox",
        duration: "13h",
        icon: Icons.psychology,
        color: const Color(0xFFDCC6E9),
      ),
      ActivityModel(
        title: "Gratitude\nBreath",
        duration: "34h",
        icon: Icons.air,
        color: const Color(0xFFD6ECF8),
      ),
      ActivityModel(
        title: "Conscious\nBreath",
        duration: "34h",
        icon: Icons.spa,
        color: const Color(0xFFCDEAD6),
      ),
    ];

    final trendingActivities = [
      TrendingActivityModel(
        title: "Meditation",
        duration: "12h 32m in total",
        icon: Icons.psychology,
        color: const Color(0xFFDCC6E9),
        weeklyActivity: [false, false, false, true, false, true, false],
      ),
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            GreetingAndNotification(),

            20.ph,

            Column(
              children: [
                Row(
                  children: [
                    Text(
                      DateTimeConvertor.getHeaderDate(DateTime.now()),
                      style: AppTextStyles.headline3,
                    ),

                    Spacer(),

                    IconButton.filled(
                      onPressed: () {},
                      icon: Icon(Icons.add, size: 20),
                      style: IconButton.styleFrom(
                        backgroundColor: const Color(0xFFDCC6E9),
                      ),
                    ),
                  ],
                ),

                15.ph,

                DateSelector(),
              ],
            ),

            20.ph,

            Text(
              'Consistency score',
              style: AppTextStyles.headline2.copyWith(
                color: context.color.onPrimaryContainer,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),

            10.ph,

            Container(
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

            ConsistencyChart(data: consistencyData),

            30.ph,

            // favorite activities
            Center(
              child: Text(
                'Favorite activities',
                style: AppTextStyles.headline3.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            10.ph,

            SizedBox(
              height: context.screenHeight * 0.18,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return ActivityCard(activity: activities[index]);
                },
              ),
            ),

            10.ph,

            Text(
              'Trending',
              style: AppTextStyles.headline3.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            10.ph,

            TrendingCard(activity: trendingActivities[0]),
          ],
        ),
      ),
    );
  }
}
