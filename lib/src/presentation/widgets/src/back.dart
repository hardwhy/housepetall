import 'package:flutter/material.dart';
import 'package:housepetall/src/presentation/widgets/widgets.dart';

class Back extends StatelessWidget {
  final VoidCallback? onTap;
  const Back({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Ripplify(
      rippleBorderRadius: BorderRadius.circular(90),
      onTap: onTap ?? () => Navigator.pop(context),
      child: const Icon(
        Icons.arrow_back,
        color: Colors.deepOrange,
      ),
    );
  }
}
