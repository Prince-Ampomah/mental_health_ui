import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }

extension ColorSchemeExtension on BuildContext {
  ColorScheme get color => Theme.of(this).colorScheme;
}

extension EmptyPadding on num {
  /// Get the [height] of [SizedBox]
  SizedBox get ph => SizedBox(height: toDouble());

  /// Get the [width] of [SizedBox]
  SizedBox get pw => SizedBox(width: toDouble());
}

extension BuildContextExtensions on BuildContext {
  /// To get a [MediaQuery] directly.
  MediaQueryData get mq => MediaQuery.of(this);

  /// Get MediaQuery Screen Size
  Size get screenSize => mq.size;

  /// Get MediaQuery Screen Width
  double get screenWidth => mq.size.width;

  /// Get MediaQuery Screen Height
  double get screenHeight => mq.size.height;

  /// Get MediaQuery Screen Width in percentage
  double get widthInPercent => screenWidth / 100;

  /// Get MediaQuery Screen height in percentage
  double get heightInPercent => screenHeight / 100;

  ///Returns [Orientation] using [MediaQuery]
  Orientation get orientation => mq.orientation;

  /// Returns if [Orientation] is landscape
  bool get isLandscape => mq.orientation == Orientation.landscape;

  /// Returns the type of device based on width
  DeviceType get deviceType {
    if (screenWidth >= 1200) return DeviceType.desktop;
    if (screenWidth >= 600) return DeviceType.tablet;
    return DeviceType.mobile;
  }

  /// Convenience booleans for responsiveness
  bool get isMobile => deviceType == DeviceType.mobile;
  bool get isTablet => deviceType == DeviceType.tablet;
  bool get isDesktop => deviceType == DeviceType.desktop;
}
