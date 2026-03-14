import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';
import 'package:mental_health_ui/core/utils/extension.dart';
import 'package:mental_health_ui/features/dashboard/model/chart_model.dart';

class ConsistencyChart extends StatelessWidget {
  final List<ConsistencyData> data;

  const ConsistencyChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    const double maxHeight = 150;

    return Column(
      children: [
        /// BAR SECTION
        SizedBox(
          height: maxHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,

            children: data.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;

              final barHeight = maxHeight * item.value;

              return TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: barHeight),

                duration: Duration(milliseconds: 500 + (index * 150)),
                curve: Curves.easeOutCubic,
                builder: (context, double value, Widget? child) {
                  return Container(
                    width: 40,
                    height: value,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      // gradient: item.isHighlighted
                      //     ? const LinearGradient(
                      //         begin: Alignment.bottomCenter,
                      //         end: Alignment.topCenter,
                      //         colors: [Color(0xFF1F5F63), Color(0xFF3E8E93)],
                      //       )
                      //     : null,
                      color: item.isHighlighted
                          ? context.color.primary
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: item.isHighlighted
                        ? Text(
                            item.value.toString(),
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: Colors.white,
                            ),
                          )
                        : null,
                  );
                },
              );
            }).toList(),
          ),
        ),

        8.ph,

        /// DAY LABELS
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: data.map((item) {
            return Container(
              width: 40,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
              decoration: BoxDecoration(
                color: item.isHighlighted
                    ? context.color.primary.withAlpha(100)
                    : null,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
              child: Text(
                item.day,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: item.isHighlighted
                      ? context.color.primary
                      : Colors.black,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
