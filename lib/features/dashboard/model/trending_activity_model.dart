import 'package:flutter/material.dart';

class TrendingActivityModel {
  final String title;
  final String duration;
  final IconData icon;
  final Color color;

  /// activity for each day of the week
  final List<bool> weeklyActivity;

  TrendingActivityModel({
    required this.title,
    required this.duration,
    required this.icon,
    required this.color,
    required this.weeklyActivity,
  });
}

final trendingActivities = [
  TrendingActivityModel(
    title: "Meditation",
    duration: "12h 32m in total",
    icon: Icons.psychology,
    color: const Color(0xFFDCC6E9),
    weeklyActivity: [false, false, false, true, false, true, false],
  ),
];
