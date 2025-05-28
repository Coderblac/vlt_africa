import 'package:flutter/cupertino.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;
  const Responsive(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});

      static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 450;}
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 451 &&
        MediaQuery.of(context).size.width <= 1024;
  }
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > 1024 &&
        MediaQuery.of(context).size.width < 1921;
  }

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    if (size.width <= 450) {
      // if width is less than 451 we consider it mobile
      return mobile;
    } else if (size.width >= 451 && size.width <= 1025) {
      // if width is between 451 and 1024 we consider it tablet
      return tablet!;
    } else if (size.width > 1024 && size.width < 1921) {
      // if width is greater than or equal to 1024 and if width is less than 1921 we consider it desktop
      return desktop;
    }
    // Fallback in case none of the conditions match
    return mobile;
  }
}
