import 'package:flutter/material.dart';
import 'package:housepetall/src/localization/localization.dart';
import 'package:housepetall/src/presentation/screen/review/review_constants.dart';
import 'package:housepetall/src/presentation/widgets/widgets.dart';

class EmptyReviews extends StatelessWidget {
  const EmptyReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, -.3),
      child: Empty(
        imageSize: 300,
        imageAsset: ReviewConstants.assets.empty,
        title: context.strings.reviewHomeEmptyTitle,
        description: context.strings.reviewHomeEmptyDescription,
      ),
    );
  }
}
