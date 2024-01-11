import 'package:flutter/material.dart';

class ResponsiveLayout {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static bool isSmallScreen(BuildContext context) {
    return screenWidth(context) < 600;
  }

  static bool isMediumScreen(BuildContext context) {
    return screenWidth(context) >= 600 && screenWidth(context) < 900;
  }

  static bool isLargeScreen(BuildContext context) {
    return screenWidth(context) >= 900;
  }
}
