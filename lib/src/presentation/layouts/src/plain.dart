import 'package:flutter/material.dart';
import 'package:housepetall/src/presentation/layouts/src/layout.dart';
import 'package:housepetall/src/presentation/widgets/widgets.dart';

class PlainLayout extends Layout {
  const PlainLayout({
    super.key,
    required super.child,
    super.title,
  });

  @override
  PreferredSizeWidget appBarBuilder() {
    return TopBar(
      withBack: true,
      title: title,
    );
  }
}
