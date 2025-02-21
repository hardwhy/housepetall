import 'package:flutter/material.dart';
import 'package:housepetall/src/presentation/layouts/src/layout.dart';

class Clean extends Layout {
  const Clean({required super.child, super.key});

  @override
  PreferredSizeWidget? appBarBuilder() {
    return null;
  }
}
