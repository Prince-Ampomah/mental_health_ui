import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
    required this.tabName,
    this.fontSize = 16.0,
  });

  final String tabName;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Align(
        alignment: Alignment.center,
        child: Text(tabName, style: TextStyle(fontSize: fontSize)),
      ),
    );
  }
}
