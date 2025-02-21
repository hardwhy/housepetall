// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:housepetall/src/domain/domain.dart';
import 'package:housepetall/src/presentation/screen/review/review_constants.dart';
import 'package:housepetall/src/presentation/screen/review/widgets/rating.dart';
import 'package:housepetall/src/presentation/themes/themes.dart';
import 'package:sprintf/sprintf.dart';

class ReviewContentProp {
  final Review review;
  final bool compactMode;

  ReviewContentProp({
    required this.review,
    this.compactMode = true,
  });
}

class ReviewContent extends StatelessWidget {
  final ReviewContentProp prop;
  const ReviewContent({
    super.key,
    required this.prop,
  });

  Review get _review => prop.review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        HeaderSection(prop: prop),
        if (_review.comment?.isNotEmpty ?? false)
          Flexible(child: CommentSection(prop: prop))
      ],
    );
  }
}

class CommentSection extends StatelessWidget {
  const CommentSection({
    super.key,
    required this.prop,
  });

  final ReviewContentProp prop;

  String get _comment => prop.review.comment ?? '';
  bool get _compactMode => prop.compactMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        Flexible(
          child: SizedBox(
            width: double.infinity,
            child: Paragraph(
              _comment,
              align: TextAlign.start,
              maxLines: _compactMode ? 2 : null,
              overflow: _compactMode ? TextOverflow.ellipsis : null,
            ),
          ),
        )
      ],
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.prop,
  });

  final ReviewContentProp prop;

  Review get _review => prop.review;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: sprintf(
        ReviewConstants.heroTags.reviewContent,
        [_review.id],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (prop.compactMode) ...[
                  _buildOwnerRow(),
                  SizedBox(height: 8),
                ],
                _buildPetRow(),
              ],
            ),
          ),
          Expanded(flex: 3, child: Rating(rating: _review.rating)),
        ],
      ),
    );
  }

  Widget _buildOwnerRow() {
    return Flexible(
      child: Row(
        children: [
          _buildAvatar(_review.ownerName[0]),
          const SizedBox(width: 8),
          Body1.bold(_review.ownerName),
        ],
      ),
    );
  }

  Widget _buildPetRow() {
    return Flexible(
      child: Row(
        children: [
          _buildAvatar(_review.petName[0]),
          const SizedBox(width: 8),
          Body1(_review.petName),
        ],
      ),
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
