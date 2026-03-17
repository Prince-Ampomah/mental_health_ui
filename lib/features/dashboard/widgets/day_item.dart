import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/utils/extension.dart';

class DayItem extends StatelessWidget {
  final DateTime date;
  final bool isSelected;

  const DayItem({super.key, required this.date, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: 42,
      height: 42,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? context.color.primary : Colors.white,
        boxShadow: [
          if (isSelected)
            BoxShadow(
              color: Colors.black.withAlpha(100),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
        ],
      ),
      child: Text(
        "${date.day}",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.white : Colors.black87,
        ),
      ),
    );
  }
}
