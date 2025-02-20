import 'package:flutter/material.dart';
import 'package:housepetall/src/presentation/layouts/src/layout.dart';
import 'package:housepetall/src/presentation/widgets/widgets.dart';

class PlainLayout extends Layout {
  const PlainLayout({
    super.key,
    required super.child,
    super.title,
    super.withPadding,
    super.footer,
  });

  @override
  PreferredSizeWidget appBarBuilder() {
    return TopBar(
      withBack: false,
      title: title,
    );
  }
}
