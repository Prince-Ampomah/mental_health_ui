import 'package:flutter/material.dart';

class ActivityModel {
  final String title;
  final String duration;
  final IconData icon;
  final Color color;

  ActivityModel({
    required this.title,
    required this.duration,
    required this.icon,
    required this.color,
  });

  static const double cardHeight = 150;
}

final activities = [
  ActivityModel(
    title: "Mind\nDetox",
    duration: "13h",
    icon: Icons.psychology,
    color: const Color(0xFFDCC6E9),
  ),
  ActivityModel(
    title: "Gratitude\nNotes",
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
