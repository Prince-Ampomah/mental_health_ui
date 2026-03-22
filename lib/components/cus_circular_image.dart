import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.child,
    this.height,
    this.width,
    this.boxBorder,
    this.boxShape = BoxShape.circle,
    this.borderRadius,
    this.margin,
    this.padding,
    this.bgColor,
  });

  final Widget? child;
  final double? height, width;
  final BoxBorder? boxBorder;
  final BorderRadius? borderRadius;
  final BoxShape boxShape;
  final EdgeInsetsGeometry? margin, padding;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: bgColor,
        shape: boxShape,
        border: boxBorder,
        
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(100),
        child: child ??
            Image.asset(
              'assets/images/user.png',
              fit: BoxFit.cover,
            ),
      ),
    );
  }
}
