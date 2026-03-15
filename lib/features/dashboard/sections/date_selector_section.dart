import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/resources/resources.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';
import 'package:mental_health_ui/core/utils/date_time_convertor.dart';
import 'package:mental_health_ui/core/utils/extension.dart';
import 'package:mental_health_ui/features/dashboard/widgets/date_selector.dart';

class DateSelectorSection extends StatelessWidget {
  const DateSelectorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              DateTimeConvertor.getHeaderDate(DateTime.now()),
              style: AppTextStyles.headline3,
            ),

            Spacer(),

            IconButton.filled(
              onPressed: () {},
              icon: Icon(Icons.add, size: 20, color: Colors.black),
              style: IconButton.styleFrom(backgroundColor: AppColors.lavender),
            ),
          ],
        ),

        15.ph,

        DateSelector(),
      ],
    );
  }
}
