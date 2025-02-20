import 'package:flutter/material.dart';
import 'package:housepetall/src/localization/localization.dart';
import 'package:housepetall/src/presentation/screen/review/review.dart';
import 'package:housepetall/src/presentation/themes/themes.dart';
import 'package:housepetall/src/presentation/widgets/widgets.dart';

class ReviewFooter extends StatelessWidget {
  const ReviewFooter({
    super.key,
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
        title: context.strings.reviewHomeSubmitButton,
        onTap: () {
          Navigator.pushNamed(context, ReviewRoutes.submit);
        },
      ),
    );
  }
}
