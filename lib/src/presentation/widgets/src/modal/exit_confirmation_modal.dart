import 'package:flutter/material.dart';
import 'package:housepetall/src/localization/localization.dart';
import 'package:housepetall/src/presentation/screen/review/review_constants.dart';
import 'package:housepetall/src/presentation/widgets/widgets.dart';

showExitConfirmationSheet({required BuildContext context}) {
  showSheet(
    context,
    isDismissible: false,
    child: Column(
      children: [
        Empty(
          imageAsset: ReviewConstants.assets.quit,
          imageSize: 200,
          title: context.strings.commonExitConfirmationTitle,
          description: context.strings.commonExitConfirmationMessage,
        ),
        Spacer(),
        Expanded(
          child: Knob(
            width: double.infinity,
            backgroundColor: Colors.red,
            title: context.strings.commonButtonTitleYes,
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Knob(
            width: double.infinity,
            backgroundColor: Colors.deepOrange[50],
            titleColor: Colors.deepOrange,
            title: context.strings.commonButtonTitleNo,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    ),
  );
}
