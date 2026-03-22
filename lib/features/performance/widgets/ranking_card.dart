import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/utils/extension.dart';
import 'package:mental_health_ui/features/performance/models/performance_model.dart';
import 'package:mental_health_ui/features/performance/widgets/activity_stat.dart';
import 'package:mental_health_ui/features/performance/widgets/header.dart';

class RankingCard extends StatelessWidget {
  const RankingCard({super.key, required this.ranking});

  final RankingModel ranking;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Header(ranking: ranking),
          10.ph,
          Divider(),
          10.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: activityStats
                .map((stat) => ActivityStat(stat: stat))
                .toList(),
          ),
        ],
      ),
    );
  }
}
