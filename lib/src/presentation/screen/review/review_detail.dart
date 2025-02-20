// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:housepetall/src/common/util/color.dart';

import 'package:housepetall/src/domain/domain.dart';
import 'package:housepetall/src/localization/localization.dart';
import 'package:housepetall/src/presentation/layouts/src/basic.dart';
import 'package:housepetall/src/presentation/screen/review/review_constants.dart';
import 'package:housepetall/src/presentation/screen/review/widgets/review_content.dart';
import 'package:sprintf/sprintf.dart';
import 'package:svg_flutter/svg.dart';

class ReviewDetailProp {
  final Review review;

  ReviewDetailProp({required this.review});
}

class ReviewDetail extends StatelessWidget {
  const ReviewDetail({
    super.key,
    required this.prop,
  });
  final ReviewDetailProp prop;

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      title: sprintf(
        context.strings.reviewDetailNameFormat,
        [prop.review.ownerName],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              ReviewConstants.assets.detail,
              width: 200,
              colorFilter: ColorFilter.mode(
                Colors.white.adjustOpacity(.9),
                BlendMode.srcATop,
              ), // Blend the color with the SVG
            ),
          ),
          Positioned.fill(
            child: ReviewContent(
              prop: ReviewContentProp(review: prop.review, compactMode: false),
            ),
          ),
        ],
      ),
    );
  }
}
