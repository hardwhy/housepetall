import 'package:flutter/material.dart';
import 'package:housepetall/src/presentation/themes/themes.dart';


class TopBar extends AppBar {
  final bool withBack;
  final VoidCallback? onBack;
  TopBar({
    super.key,
    String? title,
    this.withBack = true,
    this.onBack,
  }) : super(
          automaticallyImplyLeading: false,
          title: H3(title ?? ''),
          centerTitle: true,
          elevation: 0,
        );
}
