import 'package:flutter/material.dart';
import 'package:housepetall/src/presentation/widgets/widgets.dart';

export 'routes.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Our reviews',
      ),
    );
  }
}
