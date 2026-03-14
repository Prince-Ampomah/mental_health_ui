import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';
import 'package:mental_health_ui/core/utils/date_time_convertor.dart';

class GreetingAndNotification extends StatelessWidget {
  const GreetingAndNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceAround,
      children: [
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              "${DateTimeConvertor.greetingTime()},",
              style: AppTextStyles.headline2,
            ),
            Text("Prince 👋", style: AppTextStyles.headline2),
          ],
        ),
        Spacer(),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(Icons.notifications_outlined, size: 30),
        ),
      ],
    );
  }
}
