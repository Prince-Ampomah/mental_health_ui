import 'package:flutter/material.dart';
import 'package:mental_health_ui/features/dashboard/widgets/day_item.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({super.key});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  late List<DateTime> days;
  DateTime selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    days = generateWeek();
  }

  List<DateTime> generateWeek() {
    final today = DateTime.now();

    return List.generate(
      7,
      (index) =>
          today.subtract(const Duration(days: 3)).add(Duration(days: index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (context, index) {
          final day = days[index];
          final isSelected =
              day.day == selectedDay.day && day.month == selectedDay.month;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDay = day;
              });
            },
            child: DayItem(date: day, isSelected: isSelected),
          );
        },
      ),
    );
  }
}
