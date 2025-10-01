import 'package:flutter/material.dart';

// Singeltone Media Query
class MediaSize {
  static late double width;
  static late double height;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
  }
}

enum ScreenSize {
  small(300),
  normal(600),
  large(1000);

  final double size;

  const ScreenSize(this.size);
}

ScreenSize getScreenSize(BuildContext context) {
  double deviceWidth = MediaQuery.sizeOf(context).shortestSide;
  if (deviceWidth > ScreenSize.large.size) return ScreenSize.large;
  if (deviceWidth > ScreenSize.normal.size) return ScreenSize.normal;
  return ScreenSize.small;
}

// Reusabkle Code

class ResponsiveLayout extends StatelessWidget {
  var mobile;
  var tablet;
  var desktop;

  ResponsiveLayout({Key? key, required this.mobile, this.tablet, this.desktop})
    : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 1024) {
      return desktop ?? tablet ?? mobile; // fallback
    } else if (width >= 600) {
      return tablet ?? mobile; // fallback
    } else {
      return mobile;
    }
  }
}
