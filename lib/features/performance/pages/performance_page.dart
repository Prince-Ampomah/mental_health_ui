import 'package:flutter/material.dart';
import 'package:mental_health_ui/components/cus_tab.dart';
import 'package:mental_health_ui/components/cus_tab_bar.dart';
import 'package:mental_health_ui/core/utils/extension.dart';
import 'package:mental_health_ui/features/performance/pages/activity_page.dart';
import 'package:mental_health_ui/features/performance/sections/performance_header_section.dart';
import 'package:mental_health_ui/features/performance/pages/rankings_page.dart';

class PerformancePage extends StatefulWidget {
  const PerformancePage({super.key});

  @override
  State<PerformancePage> createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PerformanceHeaderSection(),

        CustomTabBar(
          tabController: tabController,
          indicatorWeight: 2.5,
          labelColor: context.color.primary,
          indicatorColor: context.color.primary,
          unselectedLabelColor: Colors.grey[600],
          tabBarIndicatorSize: TabBarIndicatorSize.label,
          isScrollable: false,
          labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
          tabs: [
            CustomTab(tabName: 'Activity'),
            CustomTab(tabName: 'Rankings'),
          ],
        ),

        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [ActivityPage(), RankingsPage()],
          ),
        ),
      ],
    );
  }
}
