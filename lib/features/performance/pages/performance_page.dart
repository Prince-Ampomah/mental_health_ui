import 'package:flutter/material.dart';
import 'package:mental_health_ui/features/performance/sections/performance_header_section.dart';
import 'package:mental_health_ui/features/performance/sections/rankings_section.dart';
import 'package:mental_health_ui/features/performance/sections/activity_section.dart';

class PerformancePage extends StatefulWidget {
  const PerformancePage({super.key});

  @override
  State<PerformancePage> createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {
  int _selectedTab = 1; // Default to Rankings (matches original design)

  @override
  Widget build(BuildContext context) {
    // No Scaffold — AppShellLayout provides it
    return ColoredBox(
      color: const Color(0xFFEAF4F4),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title + bell + tab switcher
            PerformanceHeaderSection(
              selectedTab: _selectedTab,
              onTabChanged: (tab) => setState(() => _selectedTab = tab),
            ),

            // Tab content
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: _selectedTab == 1
                  ? const RankingsSection(key: ValueKey('rankings'))
                  : const ActivitySection(key: ValueKey('activity')),
            ),
          ],
        ),
      ),
    );
  }
}
