import 'package:flutter/material.dart';
import 'package:housepetall/src/localization/localization.dart';
import 'package:housepetall/src/presentation/layouts/src/basic.dart';
import 'package:housepetall/src/presentation/screen/review/widgets/rating.dart';
import 'package:housepetall/src/presentation/widgets/widgets.dart';

class ReviewSubmission extends StatelessWidget {
  const ReviewSubmission({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      title: context.strings.reviewFormTitle,
      child: Form(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Rating.input(
                onTap: (value) {},
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Input(
                    label: context.strings.reviewFormNameLabel,
                    mandatory: true,
                    placeholder: context.strings.reviewFormNamePlaceHolder,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Input(
                    label: context.strings.reviewFormPetsNameLabel,
                    mandatory: true,
                    placeholder: context.strings.reviewFormPetsNamePlaceHolder,
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            Input(
              label: context.strings.reviewFormCommentLabel,
              placeholder: context.strings.reviewFormCommentPlaceHolder,
              minLine: 5,
              maxLine: null,
            )
          ],
        ),
      ),
    );
  }
}
