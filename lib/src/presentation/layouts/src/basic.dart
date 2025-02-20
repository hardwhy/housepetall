import 'package:flutter/material.dart';
import 'package:housepetall/src/presentation/layouts/src/layout.dart';
import 'package:housepetall/src/presentation/widgets/widgets.dart';

class BasicLayout extends Layout {
  final VoidCallback? onBack;
  const BasicLayout({
    super.key,
    this.onBack,
    required super.child,
    super.title,
  });

  @override
  PreferredSizeWidget appBarBuilder() {
    return TopBar(withBack: true, onBack: onBack, title: title);
  }
}
