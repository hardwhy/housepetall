// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:housepetall/src/domain/domain.dart';
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
      onTap: () {},
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: Shadows.elevation2(color: Colors.black38),
      ),
      constraints: BoxConstraints(maxHeight: 200, minHeight: 150),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          HeaderSection(review: review),
          if (review.comment != null)
            Flexible(child: CommentSection(review: review))
        ],
      ),
    );
  }
}

class CommentSection extends StatelessWidget {
  const CommentSection({
    super.key,
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(color: Colors.deepOrange[50]),
        Flexible(
          child: Paragraph(
            review.comment!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildOwnerRow(), SizedBox(height: 8), _buildPetRow()],
        ),
        Rating(rating: review.rating),
      ],
    );
  }

  Widget _buildOwnerRow() {
    return Row(
      children: [
        _buildAvatar(review.ownerName[0]),
        const SizedBox(width: 8),
        Body1.bold(review.ownerName),
      ],
    );
  }

  Widget _buildPetRow() {
    return Row(
      children: [
        _buildAvatar(review.petName[0]),
        const SizedBox(width: 8),
        Body1(review.petName),
      ],
    );
  }

  Widget _buildAvatar(String initial) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: Colors.deepOrange[((Random().nextInt(9) + 1) * 100)],
      child: Body1.bold(initial, color: Colors.white),
    );
  }
}

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.rating,
  });

  final int rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final order = index + 1;
          Color? color = Colors.grey[300];
          if (order <= rating) {
            color = Colors.amber[600];
          }
          return Icon(
            Icons.star_rounded,
            color: color,
            size: 24,
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 2),
        itemCount: 4,
      ),
    );
  }
}
