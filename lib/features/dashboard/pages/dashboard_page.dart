import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';
import 'package:mental_health_ui/core/utils/date_time_convertor.dart';
import 'package:mental_health_ui/features/dashboard/widgets/greeting_and_notification.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            // greetings & notification layout
            GreetingAndNotification(),
          ],
        ),
      ),
    );
  }
}
