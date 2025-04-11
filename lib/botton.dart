import 'package:flutter/material.dart';

class HelperButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color btnColor;
  final Color titleColor;
  const HelperButton(
      {super.key,
      required this.onTap,
      required this.title,
      required this.btnColor,
      required this.titleColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor:
              btnColor, //Theme.of(context).colorScheme.primary, //CustomHexColors.fromHex('#2a3935'),
          foregroundColor: btnColor,
          // side: BorderSide(),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      child: Text(
        title,
        style: TextStyle(color: titleColor, fontWeight: FontWeight.w500),
      ),
    );
  }
}
