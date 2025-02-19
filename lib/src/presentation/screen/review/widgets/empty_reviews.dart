import 'package:flutter/material.dart';
import 'package:housepetall/src/localization/localization.dart';
import 'package:housepetall/src/presentation/screen/review/asset_path.dart';
import 'package:housepetall/src/presentation/widgets/widgets.dart';

class EmptyReviews extends StatelessWidget {
  const EmptyReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, -.4),
      child: Empty(
        imageSize: 250,
        imageAsset: ReviewAssetPath.empty,
        title: context.strings.reviewHomeEmptyTitle,
        description: context.strings.reviewHomeEmptyDescription,
      ),
    );
  }
}