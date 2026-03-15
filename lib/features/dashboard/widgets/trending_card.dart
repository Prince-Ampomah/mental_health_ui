import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';
import 'package:mental_health_ui/core/utils/extension.dart';
import 'package:mental_health_ui/features/dashboard/model/trending_activity_model.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({super.key, required this.activity});

  final TrendingActivityModel activity;

  @override
  Widget build(BuildContext context) {
    const days = ['s', 'm', 't', 'w', 't', 'f', 's'];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          /// LEFT SIDE
          Expanded(
            child: Row(
              children: [
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCC6E9),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(
                    Icons.psychology,
                    color: Colors.white,
                    size: 28,
                  ),
                ),

                12.pw,

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity.title,
                      style: AppTextStyles.headline3.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    4.ph,

                    Row(
                      children: [
                        const Icon(Icons.schedule, size: 14),
                        4.pw,
                        Text(
                          activity.duration,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // const Spacer(),

          /// RIGHT SIDE
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              /// LAST WEEK TILE
              Row(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                children: [
                  Text("Last week"),
                  4.pw,
                  Icon(Icons.chevron_right, size: 18),
                ],
              ),

              8.ph,

              /// Week indicators
              Row(
                children: List.generate(
                  activity.weeklyActivity.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: 8.5,
                    height: 8.5,
                    decoration: BoxDecoration(
                      color: activity.weeklyActivity[index]
                          ? activity.color
                          : Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),

              /// WEEKDAY LABELS
              Row(
                children: days.map((day) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Text(
                      day,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
