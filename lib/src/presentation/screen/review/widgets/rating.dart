import 'package:flutter/material.dart';
import 'package:housepetall/src/presentation/themes/themes.dart';
import 'package:housepetall/src/presentation/widgets/widgets.dart';

enum RatingType { input, none }

class Rating extends StatefulWidget {
  const Rating.input({
    super.key,
    this.rating = 0,
    required this.onTap,
  }) : ratingType = RatingType.input;

  const Rating({
    super.key,
    required this.rating,
  })  : onTap = null,
        ratingType = RatingType.none;

  final int rating;
  final Function(int value)? onTap;
  final RatingType ratingType;

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  late int _rating;
  bool get _isInput => widget.ratingType == RatingType.input;

  @override
  void initState() {
    super.initState();
    _rating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_isInput) ...[Paragraph.bold('Rating'), SizedBox(height: 16)],
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index) {
            final order = index + 1;
            VoidCallback? action;
            Color? color = Colors.grey[300];
            if (order <= _rating) {
              color = Colors.amber[600];
            }
            if (_isInput) {
              action = () {
                setState(() {
                  _rating = order;
                });
                widget.onTap!(order);
              };
            }

            return Ripplify(
              onTap: action,
              child: Icon(
                Icons.star_rounded,
                color: color,
                size: 24,
              ),
            );
          }),
        ),
      ],
    );
  }
}
