import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String headerText;
  final Color headerTextColor;
  final bool isMobile;
  const HeaderText({super.key, required this.headerText, required this.headerTextColor, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Text(headerText,
    style: TextStyle(color: headerTextColor,
    fontSize: isMobile ? 24 : 32,
    fontWeight: FontWeight.bold,),);
  }
}