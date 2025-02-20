// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:housepetall/src/localization/localization.dart';
import 'package:housepetall/src/presentation/screen/review/routes.dart';
import 'package:housepetall/src/presentation/themes/themes.dart';
import 'package:housepetall/src/presentation/widgets/widgets.dart';

class ReviewFooter extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const ReviewFooter({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: Shadows.elevation2(color: Colors.black),
      ),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 50),
      child: Knob(
        width: double.infinity,
        title: title,
        onTap: onTap,
      ),
    );
  }
}
