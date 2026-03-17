import 'package:flutter/material.dart';

// ── Leaderboard entry ──
class RankingModel {
  final int rank;
  final String name;
  final int score;
  final String imagePath;

  const RankingModel({
    required this.rank,
    required this.name,
    required this.score,
    required this.imagePath,
  });
}

// ── Breath / Notes / Detox stat ──
class ActivityStatModel {
  final String label;
  final String value;
  final IconData icon;
  final Color iconColor;

  const ActivityStatModel({
    required this.label,
    required this.value,
    required this.icon,
    required this.iconColor,
  });
}

// ── Trending activity with sparkline data ──
class TrendingResultModel {
  final String title;
  final String duration;
  final IconData icon;
  final Color iconBgColor;
  final List<double> sparklineData; // normalized 0.0–1.0

  const TrendingResultModel({
    required this.title,
    required this.duration,
    required this.icon,
    required this.iconBgColor,
    required this.sparklineData,
  });
}

// ── Sample data ──

final rankings = [
  const RankingModel(
    rank: 1,
    name: 'Geremy Boundea',
    score: 9988,
    imagePath: '',
  ),
  const RankingModel(
    rank: 2,
    name: 'Amara Nwosu',
    score: 8741,
    imagePath: '',
  ),
  const RankingModel(
    rank: 3,
    name: 'Prince Osei',
    score: 7654,
    imagePath: '',
  ),
  const RankingModel(
    rank: 4,
    name: 'Lena Fischer',
    score: 6320,
    imagePath: '',
  ),
];

final activityStats = [
  const ActivityStatModel(
    label: 'Breath',
    value: '3,330s',
    icon: Icons.self_improvement,
    iconColor: Color(0xFF4CAF50),
  ),
  const ActivityStatModel(
    label: 'Notes',
    value: '2,331p',
    icon: Icons.auto_awesome,
    iconColor: Color(0xFF9C27B0),
  ),
  const ActivityStatModel(
    label: 'Detox',
    value: '3m',
    icon: Icons.psychology,
    iconColor: Color(0xFF2196F3),
  ),
];

final trendingResult = const TrendingResultModel(
  title: 'Conscious Breath',
  duration: '19h 32m in total',
  icon: Icons.self_improvement,
  iconBgColor: Color(0xFFCDEAD6),
  sparklineData: [0.4, 0.6, 0.5, 0.8, 0.6, 0.9, 0.7],
);
