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
