import 'package:flutter/material.dart';
import 'package:mental_health_ui/components/cus_circular_image.dart';
import 'package:mental_health_ui/components/cus_rich_text.dart';
import 'package:mental_health_ui/core/resources/resources.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';
import 'package:mental_health_ui/core/utils/extension.dart';
import 'package:mental_health_ui/features/performance/models/performance_model.dart';
import 'package:mental_health_ui/features/performance/pages/activity_page.dart';
import 'package:mental_health_ui/features/performance/widgets/ranking_card.dart';

class RankingsPage extends StatelessWidget {
  const RankingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rankings.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index < rankings.length) {
          return RankingCard(ranking: rankings[index]);
        }
        return ActivityPage();
      },
    );
  }
}
