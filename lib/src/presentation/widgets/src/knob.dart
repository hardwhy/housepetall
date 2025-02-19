// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:housepetall/src/presentation/themes/themes.dart';

class Knob extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final Color? backgroundColor;
  final Color? titleColor;
  final double? width;
  const Knob({
    super.key,
    this.onTap,
    required this.title,
    this.backgroundColor,
    this.titleColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          disabledBackgroundColor: Colors.deepOrange[100],
          backgroundColor:
              backgroundColor ?? Colors.deepOrange, // Button background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Adjust border radius here
          ),
        ),
        child: ButtonTitle.big(
          title,
          color: titleColor ?? Colors.white,
        ),
      ),
    );
  }
}
