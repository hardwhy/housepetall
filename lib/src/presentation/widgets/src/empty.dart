// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:housepetall/src/presentation/themes/themes.dart';
import 'package:svg_flutter/svg.dart';

class Empty extends StatelessWidget {
  final String? imageAsset;
  final String title;
  final String? description;
  final double? imageSize;
  const Empty({
    super.key,
    this.imageAsset,
    required this.title,
    this.description,
    this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (imageAsset != null)
          SvgPicture.asset(
            imageAsset!,
            height: imageSize ?? 300,
          ),
        const SizedBox(height: 8),
        H1(
          title,
          color: Colors.deepOrange,
        ),
        if (description != null)
          Body1(
            description!,
            align: TextAlign.center,
          )
      ],
    );
  }
}
