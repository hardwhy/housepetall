import 'package:flutter/material.dart';
import 'package:housepetall/src/localization/localization.dart';
import 'package:housepetall/src/presentation/screen/review/review_constants.dart';
import 'package:housepetall/src/presentation/widgets/widgets.dart';

showFailedSubmissionSheet({required BuildContext context}) {
  showSheet(
    context,
    isDismissible: false,
    child: Column(
      children: [
        Empty(
          imageAsset: ReviewConstants.assets.empty,
          imageSize: 250,
          title: context.strings.commonErrorTitle,
          description: context.strings.reviewFormFailedSubmitMessage,
        ),
        Spacer(),
        Knob(
          width: double.infinity,
          title: context.strings.reviewFormFailedSubmitButtonTitle,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

showSuccessSubmissionSheet({required BuildContext context}) {
  showSheet(
    context,
    isDismissible: false,
    child: Column(
      children: [
        Empty(
          imageAsset: ReviewConstants.assets.success,
          imageSize: 250,
          title: context.strings.reviewFormSucceedSubmitTitle,
          description: context.strings.reviewFormSucceedSubmitMessage,
        ),
        Spacer(),
        Knob(
          width: double.infinity,
          title: context.strings.reviewFormSucceedSubmitButtonTitle,
          onTap: () {
            Navigator.pop(context);
            Navigator.pop(context, true);
          },
        )
      ],
    ),
  );
}
