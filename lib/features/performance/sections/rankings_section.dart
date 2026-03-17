import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';
import 'package:mental_health_ui/core/utils/extension.dart';
import 'package:mental_health_ui/features/performance/models/performance_model.dart';

class RankingsSection extends StatelessWidget {
  const RankingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Leaderboard cards
          ...rankings.map((r) => _RankingCard(ranking: r)),

          20.ph,

          // Activity stats row: Breath | Notes | Detox
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(10),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: activityStats
                  .map((stat) => _ActivityStat(stat: stat))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _RankingCard extends StatelessWidget {
  final RankingModel ranking;

  const _RankingCard({required this.ranking});

  @override
  Widget build(BuildContext context) {
    final isTop = ranking.rank == 1;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Rank number
          SizedBox(
            width: 24,
            child: Text(
              '${ranking.rank}',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isTop
                    ? const Color(0xFF1F5F63)
                    : Colors.grey.shade400,
              ),
            ),
          ),

          12.pw,

          // Avatar
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFDCC6E9),
              border: isTop
                  ? Border.all(color: const Color(0xFF1F5F63), width: 2)
                  : null,
            ),
            child: ranking.imagePath.isNotEmpty
                ? ClipOval(
                    child: Image.asset(
                      ranking.imagePath,
                      fit: BoxFit.cover,
                    ),
                  )
                : Icon(
                    Icons.person,
                    size: 24,
                    color: Colors.white.withAlpha(200),
                  ),
          ),

          12.pw,

          // Name + score
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ranking.name,
                  style: AppTextStyles.headline3.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                4.ph,
                Text(
                  'Score: ${_formatScore(ranking.score)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),

          // Chevron
          Icon(
            Icons.chevron_right_rounded,
            color: Colors.grey.shade400,
            size: 22,
          ),
        ],
      ),
    );
  }

  String _formatScore(int score) {
    if (score >= 1000) {
      return '${(score / 1000).toStringAsFixed(score % 1000 == 0 ? 0 : 3).replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '')},${(score % 1000).toString().padLeft(3, '0')}';
    }
    return score.toString();
  }
}

class _ActivityStat extends StatelessWidget {
  final ActivityStatModel stat;

  const _ActivityStat({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(stat.icon, color: stat.iconColor, size: 26),
        6.ph,
        Text(
          stat.label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade500,
          ),
        ),
        4.ph,
        Text(
          stat.value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
