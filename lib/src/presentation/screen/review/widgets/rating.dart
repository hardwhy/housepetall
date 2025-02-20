import 'package:flutter/material.dart';
import 'package:housepetall/src/presentation/themes/themes.dart';
import 'package:housepetall/src/presentation/widgets/widgets.dart';

enum RatingType { input, none }

class RatingFormField extends FormField<int> {
  RatingFormField({
    super.key,
    int initialValue = 0,
    super.enabled = true,
    super.onSaved,
    super.validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(
          initialValue: initialValue,
          autovalidateMode: autovalidateMode,
          builder: (FormFieldState<int> field) {
            return Rating.input(
              rating: field.value ?? 0,
              onTap: (value) {
                field.didChange(value);
              },
              errorText: field.errorText,
            );
          },
        );
}

class Rating extends StatefulWidget {
  const Rating.input({
    super.key,
    this.rating = 0,
    required this.onTap,
    this.errorText,
  }) : ratingType = RatingType.input;

  const Rating({
    super.key,
    required this.rating,
  })  : onTap = null,
        errorText = null,
        ratingType = RatingType.none;

  final int rating;
  final Function(int value)? onTap;
  final RatingType ratingType;
  final String? errorText;

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
  void didUpdateWidget(Rating oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.rating != widget.rating) {
      _rating = widget.rating;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_isInput) ...[
          Row(
            children: [
              const Paragraph.bold('Rating'),
              const Paragraph.bold(
                '*',
                color: Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
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
        if (widget.errorText != null) ...[
          const SizedBox(height: 8),
          Text(
            widget.errorText!,
            style: Theme.of(context).inputDecorationTheme.errorStyle,
          ),
        ],
      ],
    );
  }
}
