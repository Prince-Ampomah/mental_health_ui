import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final Color? backgroudColor, selectedItemColor;
  final int currentIndex;
  final Function(int)? onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    this.onTap,
    this.backgroudColor,
    this.selectedItemColor,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent, // Prevent the circular effect
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: color.primary,
        unselectedItemColor: color.onSurface,
        selectedFontSize: 15.0,
        unselectedFontSize: 14.0,
        iconSize: 30.0,
        onTap: onTap,
        items: bottomItems,
      ),
    );
  }

  List<BottomNavigationBarItem> get bottomItems {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.dashboard_outlined),
        activeIcon: Icon(Icons.dashboard),
        label: 'Home',
      ),

      BottomNavigationBarItem(
        icon: Icon(Icons.psychology_outlined),
        activeIcon: Icon(Icons.psychology),
        label: 'Assistant',
      ),

      BottomNavigationBarItem(
        icon: Icon(Icons.poll_outlined),
        activeIcon: Icon(Icons.poll),
        label: 'Performance',
      ),
    ];
  }
}
