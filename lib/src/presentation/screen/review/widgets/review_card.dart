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
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: Colors.deepOrange[50]!,
        highlightColor: Colors.white,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: Shadows.elevation2(color: Colors.black38),
        ),
        constraints: BoxConstraints(maxHeight: 170),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.deepOrange[50],
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: 120,
                          height: 16,
                          color: Colors.grey, // Will be skeletonized
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.deepOrange[50],
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: 120,
                          height: 16,
                          color: Colors.grey, // Will be skeletonized
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 120,
                  height: 16,
                  color: Colors.grey, // Will be skeletonized
                )
              ],
            ),
            // const SizedBox(height: 16),
            Divider(color: Colors.deepOrange[50]),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 16,
              color: Colors.grey, // Will be skeletonized
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 16,
              color: Colors.grey, // Will be skeletonized
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
