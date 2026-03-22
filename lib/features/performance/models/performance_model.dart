import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/resources/resources.dart';

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
    imagePath: Images.user1,
  ),
  const RankingModel(
    rank: 2,
    name: 'Prince Osei',
    score: 7654,
    imagePath: Images.user3,
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

String formatScore(int score) {
  if (score >= 1000) {
    return '${(score / 1000).toStringAsFixed(score % 1000 == 0 ? 0 : 3).replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '')},${(score % 1000).toString().padLeft(3, '0')}';
  }
  return score.toString();
}
