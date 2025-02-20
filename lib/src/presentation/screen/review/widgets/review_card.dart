// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:housepetall/src/domain/domain.dart';
import 'package:housepetall/src/presentation/screen/review/pages/review.dart';
import 'package:housepetall/src/presentation/screen/review/pages/review_detail.dart';
import 'package:housepetall/src/presentation/screen/review/widgets/review_content.dart';
import 'package:housepetall/src/presentation/themes/themes.dart';
import 'package:housepetall/src/presentation/widgets/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingReviewCard extends StatelessWidget {
  const LoadingReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      enabled: true,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: Shadows.elevation2(color: Colors.black38),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(width: 100, height: 20),
                    SizedBox(width: 100, height: 20)
                  ],
                ),
                SizedBox(width: 100, height: 20)
              ],
            ),
            Divider(
              color: Colors.deepOrange[50],
            ),
            Column(
              children: [
                SizedBox(width: 100, height: 20),
                SizedBox(width: 100, height: 20)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final Review review;
  const ReviewCard({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Ripplify(
      onTap: () {
        final args = ReviewDetailProp(review: review);
        Navigator.pushNamed(context, ReviewRoutes.detail, arguments: args);
      },
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: Shadows.elevation2(color: Colors.black38),
      ),
      constraints: BoxConstraints(maxHeight: 200, minHeight: 150),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: ReviewContent(prop: ReviewContentProp(review: review)),
    );
  }
}
