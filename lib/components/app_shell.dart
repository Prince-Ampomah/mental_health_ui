import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mental_health_ui/components/cus_app_bar.dart';
import 'package:mental_health_ui/components/cus_bottom_nav.dart';

class AppShellLayout extends StatelessWidget {
  const AppShellLayout({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  String getTitles() {
    switch (navigationShell.currentIndex) {
      case 0:
        return 'Home';

      case 1:
        return 'Assistant';

      case 2:
        return 'Performance';

      default:
        return 'Home';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: getTitles()),
      body: SafeArea(child: navigationShell),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: onTap,
      ),
    );
  }
}
