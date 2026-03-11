import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.leadingIcon,
    this.title,
    this.actions,
    this.implyLeading = false,
    this.centerTitle = true,
    this.bgColor,
    this.titleColor = Colors.black,
    this.iconColor = Colors.black,
    this.bottom,
    this.titleStyle,
    super.key,
  });

  final Widget? leadingIcon;
  final String? title;
  final List<Widget>? actions;
  final bool implyLeading;
  final bool? centerTitle;
  final Color? bgColor, titleColor, iconColor;
  final PreferredSizeWidget? bottom;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: implyLeading,
      backgroundColor: bgColor,
      iconTheme: IconThemeData(color: iconColor),
      actionsIconTheme: IconThemeData(color: iconColor),
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      leading: leadingIcon,
      title: Text(
        title ?? '',
        style: titleStyle ?? TextStyle(color: titleColor),
      ),
      centerTitle: centerTitle,
      actions: actions,
      bottom: bottom,
      titleSpacing: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
