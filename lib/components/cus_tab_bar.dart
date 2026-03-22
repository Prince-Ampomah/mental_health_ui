import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({
    super.key,
    required this.tabs,
    this.labelColor,
    this.unselectedLabelColor,
    this.tabIndicatorDecoration,
    this.tabController,
    this.tabBarIndicatorSize,
    this.indicatorColor,
    this.indicatorWeight = 2.0,
    this.overlayColor,
    this.isScrollable = false,
    this.padding,
    this.labelPadding,
  });

  final List<Widget> tabs;
  final Color? labelColor, unselectedLabelColor, indicatorColor;
  final Decoration? tabIndicatorDecoration;
  final TabController? tabController;
  final TabBarIndicatorSize? tabBarIndicatorSize;
  final double indicatorWeight;
  final WidgetStateProperty<Color?>? overlayColor;
  final bool? isScrollable;
  final EdgeInsetsGeometry? padding, labelPadding;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: tabs,
      labelColor: labelColor,
      labelPadding: labelPadding,
      unselectedLabelColor: unselectedLabelColor,
      indicator: tabIndicatorDecoration,
      indicatorSize: tabBarIndicatorSize,
      indicatorWeight: indicatorWeight,
      indicatorColor: indicatorColor,
      isScrollable: isScrollable!,
      overlayColor: overlayColor,
      padding: padding,
    );
  }
}
