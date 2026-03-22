import 'package:flutter/material.dart';
import 'package:mental_health_ui/components/cus_circular_image.dart';
import 'package:mental_health_ui/components/cus_rich_text.dart';
import 'package:mental_health_ui/core/resources/resources.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';
import 'package:mental_health_ui/core/utils/extension.dart';
import 'package:mental_health_ui/features/performance/models/performance_model.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.ranking});
  final RankingModel ranking;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 231, 230, 230),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(ranking.rank.toString()),
        ),

        20.pw,

        Expanded(
          child: Row(
            children: [
              if (ranking.imagePath.isNotEmpty)
                CircularImage(
                  boxBorder: Border.all(width: 1),
                  child: Image.asset(
                    ranking.imagePath,
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                  ),
                )
              else
                CircularImage(
                  boxBorder: Border.all(width: 1),
                  child: Image.asset(
                    Images.user,
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                  ),
                ),

              10.pw,

              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    ranking.name,
                    style: AppTextStyles.body.copyWith(
                      fontWeight: .bold,
                      fontSize: 18,
                    ),
                  ),
                  8.ph,
                  CustomRichText(
                    text1: 'Score: ',
                    text2: ranking.score.toString(),
                    text1Style: AppTextStyles.body.copyWith(color: Colors.grey),
                    text2Style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
