import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final Color? shadowColor;
  final double? elevation;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? margin;
  final Clip? clipBehavour;
  final BorderRadius? borderRadius;
  final Function()? onTap;
  final Function()? onLongTap;

  const CustomCard({
    super.key,
    this.child,
    this.color = Colors.white,
    this.shadowColor,
    this.elevation = 0,
    this.shape = const RoundedRectangleBorder(
      side: BorderSide(width: 0.3, color: Color(0xFF8C8C8C)),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    this.margin,
    this.clipBehavour = Clip.hardEdge,
    this.borderRadius,
    this.onTap,
    this.onLongTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shadowColor: shadowColor,
      shape: shape,
      elevation: elevation,
      margin: margin,
      clipBehavior: clipBehavour,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongTap,
        borderRadius: borderRadius,
        child: child,
      ),
    );
  }
}

class CardLoadingIndicator extends StatelessWidget {
  const CardLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 2.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      height: 10,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
