import 'package:flutter/material.dart';
import 'package:housepetall/src/localization/localization.dart';
import 'package:housepetall/src/presentation/screen/review/asset_path.dart';
import 'package:housepetall/src/presentation/widgets/widgets.dart';

class EmptyReviews extends StatelessWidget {
  const EmptyReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Empty(
      imageSize: 300,
      imageAsset: ReviewAssetPath.empty,
      title: context.strings.reviewHomeEmptyTitle,
      description: context.strings.reviewHomeEmptyDescription,
    );
  }
}
